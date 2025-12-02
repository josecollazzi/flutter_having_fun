import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../../../../data/services/client/http_client_provider.dart';
import '../../domain/entities/item.dart';
import 'item_repository.dart';

const int delay= 2;

class ItemRepositoryDb implements ItemRepository {
  final Client client;
  final String baseUrl;
  const ItemRepositoryDb({required this.client, required this.baseUrl});

  @override
  Future<List<Item>> fetchItems() async {
    await Future.delayed(Duration(seconds: delay));
    return [
      Item(name: "a"),
      Item(name: "b"),
    ];
  }

  @override
  Future<Item> addRemoteItem(Item item) async {
    await Future.delayed(Duration(seconds: delay));
    return item;
  }

  @override
  Future<void> deleteRemoteItem(String id) async {
    await Future.delayed(Duration(seconds: delay));
  }
}


final itemRepositoryProvider = Provider<ItemRepository>((ref) {
  final client = ref.watch(httpClientProvider);
  const baseUrl = 'https://api.example.com'; // 🔁 change to your API
  return ItemRepositoryDb(client: client, baseUrl: baseUrl);
});