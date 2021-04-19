import 'package:flutter/material.dart';
import 'package:like_state_sync/domain/item/Item_repository.dart';

class ItemsScreen extends StatefulWidget {
  ItemsScreen({Key key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final ItemRepository _itemRepository = ItemRepository();

  @override
  Widget build(BuildContext context) {
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
              trailing: IconButton(
                icon: Icon(
                  item.like ? Icons.star : Icons.star_border_outlined,
                ),
                onPressed: () {
                  if (item.like) {
                    _itemRepository.unlike(item.id);
                  } else {
                    _itemRepository.like(item.id);
                  }
                  setState(() {});
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: _itemRepository.items().length),
    );
  }
}
