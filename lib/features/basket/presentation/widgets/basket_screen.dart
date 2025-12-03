import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/app/config/environment/environment_providers.dart';
import 'package:layout2/features/basket/domain/entities/item.dart';
import 'package:layout2/features/core/presentation/having_fun_app_bar.dart';
import '../view_models/basket_view_model.dart';

class BasketScreen extends ConsumerWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemNotifierProvider);

    final local = ref.watch(isDevelopment)?"dev": "no dev";

    return Scaffold(
        appBar: HavingFunAppBar(titleText: "Home",),
        body: items.when(
            data: (items) => _displayItems(context, items, ref),
            error: (e,__) => _error(context,e),
            loading: ()=> _loading(context))
    );
  }
  
  Widget _error(BuildContext context, Object e) {
    debugPrint(e.toString());
    return const Text("error");
  }

  Widget _loading(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }

  Widget _displayItems(BuildContext context, List<Item> items, WidgetRef ref) {
    return  Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(child: Text(item.name)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () => ref.read(itemNotifierProvider.notifier).pullItem(),
                    child: const Text("Delete Item")),
                OutlinedButton(
                    onPressed: () => ref.read(itemNotifierProvider.notifier).addItem(Item(name: "item")),
                    child: const Text("Add Item")),
              ],
            ),
          )
        ],
      );
  }
}
