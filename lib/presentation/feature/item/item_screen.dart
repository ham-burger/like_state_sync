import 'package:flutter/material.dart';
import 'package:like_state_sync/domain/item/Item_repository.dart';
import 'package:like_state_sync/presentation/component/item_like_button.dart';

class ItemScreen extends StatefulWidget {
  ItemScreen({Key key}) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  _ItemScreenState();

  final ItemRepository _itemRepository = ItemRepository();

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments as int;
    var item = _itemRepository.item(id);
    return Scaffold(
      appBar: AppBar(
        title: Text('detail screen'),
        actions: [
          ItemLikeButton(item, () {
            setState(() {});
          }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "item name: ${item.name}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("item id: ${item.id}"),
          Text("item description: ${item.description}"),
        ],
      ),
    );
  }
}
