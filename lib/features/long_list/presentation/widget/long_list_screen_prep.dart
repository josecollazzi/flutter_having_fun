import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:layout2/features/long_list/data/domain/image_handler.dart';
import 'package:layout2/features/long_list/data/repositories/reels_repository.dart';
import 'package:layout2/features/long_list/data/repositories/reels_repository_db.dart';
import 'package:layout2/features/long_list/presentation/model_view/list_reels_bloc.dart';
import 'package:layout2/features/long_list/presentation/widget/long_list_screen.dart';

class LongListScreenPrep extends StatelessWidget {
  const LongListScreenPrep({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<ReelsRepository>(
          create: (context) => ReelsRepositoryDb(),
        ),
        RepositoryProvider<ImageHandler>(
          create: (context) {
            final key = "cachemanager_having_fun";
            var config = Config(key);
            final cacheManager =  CacheManager(config);

            return ImageHandler(cacheManager);
          },
        ),
        BlocProvider<ListReelsBloc>(
          create: (context) => ListReelsBloc(
            reelsRepository: context.read<ReelsRepository>(),
          ),
        ),
      ],
      child: const LongListScreen(),
    );
  }
}