import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/model/chat/chat.dart';

final chatRoomPageProvider =
    StateNotifierProvider<ChatRoomPageViewModel, ChatRoomPageModel?>((ref) {
  return ChatRoomPageViewModel(null);
});

// 창고 (Store)
class ChatRoomPageViewModel extends StateNotifier<ChatRoomPageModel?> {
  ChatRoomPageViewModel(super.state);

  void init(List<Chat> chatDtoList) {
    state = ChatRoomPageModel(chats: chatDtoList);
  }

  void add(Chat post) {
    List<Chat> chats = state!.chats;
    List<Chat> newPosts = [...chats, post]; // 추가, 삭제, 수정, 검색
    state =
        ChatRoomPageModel(chats: newPosts); // 레퍼런스가 달라지면 된다 (값이 동일해도 다시 그린다)
  }

  // void remove(int id){
  //   List<Chat> chats = state!.chats;
  //   // 검색과 삭제
  //   List<Chat> newPosts = chats.where((e) => e.id != id).toList();
  //   state = ChatRoomPageModel(chats: newPosts);
  // }

  // void update(Chat post){
  //   List<Chat> chats = state!.chats;
  //   List<Chat> newPosts = chats.map((e) => e.id == post.id ? post : e).toList();
  //   state = ChatRoomPageModel(chats: newPosts);
  // }
}

// 창고 데이터
class ChatRoomPageModel {
  List<Chat> chats;
  ChatRoomPageModel({required this.chats});
}
