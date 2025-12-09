import 'package:bloc/bloc.dart';
import 'package:layout2/features/long_list/data/repositories/reels_repository.dart';
import 'package:layout2/features/long_list/presentation/model_view/reel_state.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
const _reelLimit = 20;

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

sealed class ReelEvent {}
final class ReelFetched extends ReelEvent {}

class ListReelsBloc extends Bloc<ReelEvent, ReelState> {
  final ReelsRepository reelsRepository;

  ListReelsBloc({required this.reelsRepository}) : super(ReelState.empty()) {
    on<ReelFetched>((event, emit) async {
      await _onFetched(event, emit);
    }, transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onFetched(ReelFetched event, Emitter<ReelState> emit) async {
    if (state.hasReachedMax) return;

    try {
      final reelsPage = await _fetchReels(state.lastPointer);

      if (reelsPage.reels.isEmpty) {
        return emit(state.copyWith(
            hasReachedMax: true,
            status: ReelStatus.success
        ));
      }

      emit(
        state.copyWith(
          status: ReelStatus.success,
          reels: [...state.reels, ...reelsPage.reels],
          currentPointer: state.lastPointer,
          lastPointer: reelsPage.nextPointer,
          hasReachedMax: reelsPage.reels.length < _reelLimit,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: ReelStatus.failure));
    }
  }
  
  Future<ReelPageResponse> _fetchReels(String pointer) async {
    return await reelsRepository.fetchReels(pointer, _reelLimit, "userId");
  }
}


