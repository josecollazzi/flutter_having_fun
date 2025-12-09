import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout2/features/long_list/data/domain/entities/reel.dart';
part 'reel_state.freezed.dart';

enum ReelStatus { initial, success, failure }

@freezed
abstract class ReelState with _$ReelState {
  const factory ReelState({
    required ReelStatus status,
    required List<Reel> reels,
    required currentPointer,
    required lastPointer,
    required bool hasReachedMax,
  }) = _ReelState;

  factory ReelState.empty() => const ReelState(status: ReelStatus.initial, currentPointer: "", lastPointer: "", reels: [], hasReachedMax: false);

  factory ReelState.fromJson(Map<String, Object?> json) {
    return ReelState.empty().copyWith(
      currentPointer: "",
      lastPointer: "",
      status: ReelStatus.values.firstWhere((element) => element.name == json['status']),
      reels: [], // need to be fixed I don't care because this is a demo, and usually I will not mix freeze with zodart library
      hasReachedMax: json["hasReachedMax"] == true,
    );
  }
}
