import 'package:flutter/material.dart';
import 'package:like_state_sync/domain/item/Item_repository.dart';
import 'package:like_state_sync/domain/item/item.dart';

class ItemLikeButton extends StatelessWidget {
  ItemLikeButton(
    this._itemRepository,
    this._item,
    this.onPressed,
  );

  final ItemRepository _itemRepository;
  final Item _item;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _item.like ? Icons.star : Icons.star_border_outlined,
      ),
      onPressed: () {
        if (_item.like) {
          _itemRepository.unlike(_item.id);
        } else {
          _itemRepository.like(_item.id);
        }
        onPressed();
      },
    );
  }
}
