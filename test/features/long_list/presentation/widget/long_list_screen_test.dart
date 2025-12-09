import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:layout2/features/long_list/data/domain/entities/reel.dart';

import 'package:layout2/features/long_list/data/domain/image_handler.dart';
import 'package:layout2/features/long_list/data/repositories/reels_repository.dart';
import 'package:layout2/features/long_list/presentation/model_view/list_reels_bloc.dart';
import 'package:layout2/features/long_list/presentation/widget/long_list_screen.dart';

import 'package:layout2/features/sing_up/domain/entities/user.dart';
import 'package:layout2/features/core/view_models/bloc/current_user_bloc.dart';
import 'package:file/memory.dart' show MemoryFileSystem;
import 'package:file/file.dart' as f show FileSystem;


class FakeReelsRepository implements ReelsRepository {
  @override
  Future<ReelPageResponse> fetchReels(String pointer, int batchSize, String userId) async {
    var json = {
      'id': "0",
      'imageId': "imageId",
      'title': "title",
      'description': "description",
      // 'color': "0xFFFFFFFF",

    };

    var reelObject = ReelSchema.zObject.parse(json);
    return ReelPageResponse([
      reelObject.value!,
    ], 'a','');
  }
}


class FakeCacheManager extends Fake implements BaseCacheManager {
  final f.FileSystem _fileSystem = MemoryFileSystem();

  // Create a 1x1 transparent PNG byte array so we don't need rootBundle/assets
  final Uint8List _transparentImage = Uint8List.fromList([
    0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D,
    0x49, 0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
    0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4, 0x89, 0x00, 0x00, 0x00,
    0x0A, 0x49, 0x44, 0x41, 0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
    0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x49,
    0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82,
  ]);

  @override
  Future<FileInfo?> getFileFromMemory(String key) async {
    final file =  _fileSystem.file("hello");
    file.writeAsBytesSync(_transparentImage);
    return FileInfo(file, FileSource.Cache, DateTime.now(), "");
  }
}


Widget _buildTestApp({
  required CurrentUserBloc currentUserBloc,
}) {
  return ProviderScope(
    child: MaterialApp(
      home: MultiBlocProvider(
        providers: [

          RepositoryProvider<ReelsRepository>(
            create: (context) => FakeReelsRepository(),
          ),
          RepositoryProvider<ImageHandler>(
            create: (context) => ImageHandler(FakeCacheManager()),
          ),
          BlocProvider<ListReelsBloc>(
            create: (context) => ListReelsBloc(
              reelsRepository: context.read<ReelsRepository>(),
            ),
          ),

          BlocProvider<CurrentUserBloc>.value(
            value: currentUserBloc,
          ),
        ],
        child: const LongListScreen(),
      ),
    ),
  );
}

void main() {
  testWidgets('shows "logged out" when user is null', (tester) async {
    final currentUserBloc = CurrentUserBloc();

    await tester.pumpWidget(
      _buildTestApp(currentUserBloc: currentUserBloc),
    );
    await tester.pumpAndSettle();
    expect(find.text('logged out'), findsOneWidget);
  },
  timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets('shows user email when user is set in bloc', (tester) async {
    final currentUserBloc = CurrentUserBloc()
      ..add(
        UserUpdateFromRiverpodProvider(
          const User(email: 'fake_email.com'),
        ),
      );

    await tester.pumpWidget(
      _buildTestApp(currentUserBloc: currentUserBloc),
    );

    await tester.pumpAndSettle();
    expect(find.text('title'), findsOneWidget);
    expect(find.text('description'), findsOneWidget);
    expect(find.text('fake_email.com'), findsOneWidget);
  },
  timeout: const Timeout(Duration(minutes: 2)),
  );
}
