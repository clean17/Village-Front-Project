import 'package:flutter/material.dart';
import 'package:village/model/chat/chat.dart';
import 'package:village/view/pages/chat/chat_room_page/widgets/chat_card.dart';

// 채팅 내역 목록 페이지 - 호스트 페이지에서 사용하면 될듯
class ChatManagerPage extends StatelessWidget {
  const ChatManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("채팅"),
      ),
      body: ListView(
        children: List.generate(
            chats.length, (index) => ChatCard(chat: chats[index])),
      ),
    );
  }
}
