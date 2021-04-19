import 'package:like_state_sync/domain/item/item.dart';

class Storage {
  static List<Item> get items => _items;

  static List<Item> _items = List<int>.generate(10, (i) => i + 1)
      .map((e) => Item(e, 'item-name-$e', "item-description-$e", false))
      .toList();

  void changeLikeState(int id, bool state) {
    _items = _items
        .map(
          (e) => Item(e.id, e.name, e.description, e.id == id ? state : e.like),
        )
        .toList();
  }
}
