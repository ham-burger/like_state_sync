import 'package:like_state_sync/domain/item/Item_repository.dart';
import 'package:like_state_sync/domain/item_like/item_like_event.dart';
import 'package:like_state_sync/inflastructure/event_bus.dart';

class ItemLikeService {
  ItemLikeService._();

  static void likeAction(ItemRepository itemRepository, int id) {
    itemRepository.like(id);
    eventBus.fire(ItemLikeEvent(id, true));
  }

  static void unlikeAction(ItemRepository itemRepository, int id) {
    itemRepository.unlike(id);
    eventBus.fire(ItemLikeEvent(id, false));
  }
}
