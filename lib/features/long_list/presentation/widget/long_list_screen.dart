import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout2/features/core/presentation/having_fun_app_bar.dart';
import 'package:layout2/features/core/view_models/bloc/current_user_bloc.dart';
import 'package:layout2/features/long_list/presentation/model_view/list_reels_bloc.dart';
import 'package:layout2/features/long_list/presentation/model_view/reel_state.dart';
import 'package:layout2/features/long_list/presentation/widget/bottom_loader.dart';
import 'package:layout2/features/long_list/presentation/widget/reel_widget.dart';
import 'package:layout2/features/sing_up/domain/entities/user.dart';

class LongListScreen extends StatefulWidget {
  const LongListScreen({super.key});

  @override
  State<LongListScreen> createState() => _LongListScreenState();
}

class _LongListScreenState extends State<LongListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ListReelsBloc>().add(ReelFetched());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HavingFunAppBar(titleText: "Long List of reels"),
      body:  BlocBuilder<CurrentUserBloc, User?>(builder: (context, userState) {
        return Column(
          children: [
            BlocBuilder<ListReelsBloc, ReelState>(builder: (context, listState){
              return Expanded(
                child: _displayList(context, listState, userState)
              );
            }),

            Text((userState == null)? "logged out": userState.email),
          ],
        );
      }),
    );
  }

  Widget _displayList(BuildContext context, ReelState state, User? user) {
    switch (state.status) {
      case ReelStatus.failure:
        return const Center(child: Text('failed to fetch Reels'));
      case ReelStatus.success:
        if (state.reels.isEmpty) {
          return const Center(child: Text('no Reels'));
        }
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return index >= state.reels.length
                ? const BottomLoader()
                : ReelWidget(reel: state.reels[index]);
          },
          itemCount: state.hasReachedMax
              ? state.reels.length
              : state.reels.length + 1,
          controller: _scrollController,
        );
      case ReelStatus.initial:
        return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ListReelsBloc>().add(ReelFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

