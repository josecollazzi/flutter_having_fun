import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout2/features/core/presentation/having_fun_app_bar.dart';
import 'package:layout2/features/core/view_models/bloc/current_user_bloc.dart';
import 'package:layout2/features/sing_up/domain/entities/user.dart';

class LongListScreen extends StatefulWidget {
  const LongListScreen({super.key});

  @override
  State<LongListScreen> createState() => _LongListScreenState();
}

class _LongListScreenState extends State<LongListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HavingFunAppBar(titleText: "Long List"),
      body:  BlocBuilder<CurrentUserBloc, User?>
        (builder: (context, state){
        return Container(
          child: Text((state == null)? "logged out": state.email),
        );
      }),
    );
  }
}

