import 'package:flutter/material.dart ';
import 'package:village/model/chat/chat.dart';
import 'package:village/view/pages/chat/chat_room_page.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key, required this.chat}) : super(key: key);

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatRoomPage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  // backgroundImage: NetworkImage(),
                ),
                title: Text(
                  chat.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(chat.content),
                contentPadding: const EdgeInsets.all(0),
              ),
            ),
            Column(
              children: [
                Text(
                  chat.time,
                  style: const TextStyle(color: Colors.black38, fontSize: 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                if (chat.count != "0")
                  Container(
                    // 내부 패딩은 내부 공간을 설정한다. 내부 공간을 추가하여 더 넓은 공간으로 만들 수 있다.
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.redAccent),
                    child: Text(
                      chat.count,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
