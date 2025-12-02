import '../../domain/entities/item.dart';

abstract class ItemRepository {
  Future<List<Item>> fetchItems();
  Future<Item> addRemoteItem(Item item);
  Future<void> deleteRemoteItem(String id);
}