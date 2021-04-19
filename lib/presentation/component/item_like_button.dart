import 'package:flutter/material.dart';
import 'package:like_state_sync/domain/item/Item_repository.dart';
import 'package:like_state_sync/domain/item/item.dart';
import 'package:like_state_sync/domain/item_like/item_like_service.dart';

class ItemLikeButton extends StatelessWidget {
  ItemLikeButton(
    this._item,
    this.onPressed, {
    ItemRepository itemRepository,
  }) : _itemRepository = itemRepository ?? ItemRepository();

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
          ItemLikeService.unlikeAction(_itemRepository, _item.id);
        } else {
          ItemLikeService.likeAction(_itemRepository, _item.id);
        }
        onPressed();
      },
    );
  }
}
