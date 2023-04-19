import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/main.dart';
import 'package:village/model/chat/chat.dart';
import 'package:village/model/chat/chat_repository.dart';
import 'package:village/view/pages/chat/chat_room_page_model.dart';

final chatController = Provider<ChatController>((ref) {
  return ChatController(ref);
});

class ChatController {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;
  ChatController(this.ref);

  Future<void> findChats() async {
    List<Chat> ChatDtoList = await ChatRepository().findAll();
    ref.read(chatRoomPageProvider.notifier).init(ChatDtoList);
  }

  Future<void> addChat(String content) async {
    Chat chat = await ChatRepository().save(content);
    ref.read(chatRoomPageProvider.notifier).add(chat);
  }

  // Future<void> removeChat(int id) async {
  //   await ChatRepository().deleteById(id);
  //   ref.read(chatRoomPageProvider.notifier).remove(id);
  // }

  // Future<void> updateChat(Chat Chat) async {
  //   Chat ChatPS = await ChatRepository().update(Chat);
  //   ref.read(chatRoomPageProvider.notifier).update(ChatPS);
  // }
}
