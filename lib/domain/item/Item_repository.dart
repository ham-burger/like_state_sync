import 'package:like_state_sync/domain/item/item.dart';
import 'package:like_state_sync/inflastructure/storage.dart';

class ItemRepository {
  final Storage _storage = Storage();

  List<Item> items() {
    return Storage.items;
  }

  Item item(int id) {
    return Storage.items.firstWhere((element) => element.id == id);
  }

  void like(int id) {
    _storage.changeLikeState(id, true);
  }

  void unlike(int id) {
    _storage.changeLikeState(id, false);
  }
}
