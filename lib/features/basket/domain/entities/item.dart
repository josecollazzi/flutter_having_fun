import 'package:freezed_annotation/freezed_annotation.dart';
part 'item.freezed.dart';
part 'item.g.dart';

@freezed
abstract class Item with _$Item {
  const factory Item({
    required String name,
  }) = _Item;

  factory Item.empty() => const Item(name: "");

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}