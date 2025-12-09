import 'dart:math';

import 'package:layout2/features/long_list/data/domain/entities/reel.dart';
import 'package:layout2/features/long_list/data/repositories/reels_repository.dart';

class ReelsRepositoryDb extends ReelsRepository {
  Future<ReelPageResponse> fetchReels(String pointer, int batchSize, String userId) async {
    await Future.delayed(Duration(seconds: 2));
    List<Reel> reels = [];

    for(var i= 0; i < batchSize; i++) {
      var json = {
        'id': pointer + i.toString(),
        'imageId': pointer + i.toString(),
        'title': "title $i",
        'description': "description $i",
        // 'color': "0xFFFFFFFF",

      };

      var reelObject = ReelSchema.zObject.parse(json);

      if (reelObject.value != null) {
        reels.add(reelObject.value!);
      }

    }

    return ReelPageResponse(reels, pointer, getRandomString(10));
  }

  String getRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random.secure();

    return List.generate(length, (_) => chars[rand.nextInt(chars.length)]).join();
  }
}