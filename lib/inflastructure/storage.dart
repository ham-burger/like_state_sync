import 'package:like_state_sync/domain/item/item.dart';

class Storage {
  List<Item> get items => List<int>.generate(10, (i) => i + 1)
      .map((e) => Item(e, 'item-name-$e', "item-description-$e", false))
      .toList();
}
