import 'package:flutter/material.dart';
import 'package:like_state_sync/domain/item/Item_repository.dart';
import 'package:like_state_sync/domain/item_like/item_like_event.dart';
import 'package:like_state_sync/inflastructure/event_bus.dart';
import 'package:like_state_sync/presentation/component/item_like_button.dart';

class ItemsScreen extends StatefulWidget {
  ItemsScreen({Key key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final ItemRepository _itemRepository = ItemRepository();
  List<ItemLikeEvent> itemLikeEvents = [];

  @override
  Widget build(BuildContext context) {
    eventBus.on<ItemLikeEvent>().listen((event) {
      // eventから対象itemIdを取得できるので
      // ちゃんと実装すれば必要なデータのみ更新することも可能
      setState(() {});
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('items screen'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var item = _itemRepository.items()[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.description),
              trailing: ItemLikeButton( item, () {
                setState(() {});
              }),
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: item.id);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: _itemRepository.items().length),
    );
  }
}
