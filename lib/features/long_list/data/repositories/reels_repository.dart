import 'package:layout2/features/long_list/data/domain/entities/reel.dart';

class ReelPageResponse {
  final List<Reel> reels;
  final String currentPointer;
  final String nextPointer;

  const ReelPageResponse(
      this.reels,
      this.currentPointer,
      this.nextPointer);
}

abstract class ReelsRepository {
  Future<ReelPageResponse> fetchReels(String pointer, int batchSize, String userId);
}