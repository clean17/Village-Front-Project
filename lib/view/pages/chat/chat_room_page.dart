import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:village/view/widgets/chat/chat_icon_button.dart';
import 'package:village/view/widgets/chat/my_chat.dart';
import 'package:village/view/widgets/chat/other_chat.dart';
import 'package:village/view/widgets/chat/time_line.dart';
import 'package:intl/intl.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomPage> {
  final List<MyChat> chats = [];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
            size: 20,
          ),
          backgroundColor: Colors.grey[200],
          title: Center(
            child: Text(
              "Village 1:1 문의",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          actions: const [
            SizedBox(
              width: 25,
            ),
            // Icon(
            //   FontAwesomeIcons.bars,
            //   size: 20,
            // ),
            SizedBox(
              width: 25,
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  const TimeLine(time: "2023년 1월 1일 금요일"),
                  const OtherChat(
                    name: "Village",
                    text: "새해 복 많이 받으세요",
                    time: "오전 10:10",
                  ),
                  const MyChat(
                    time: "오후 2:15",
                    text: "선생님도 많이 받으십시오.",
                  ),
                  ...List.generate(chats.length, (index) => chats[index]),
                ],
              )),
            ),
            Container(
              height: 60,
              color: Colors.white,
              child: Container(
                color: Colors.grey[200],
                child: Row(children: [
                  // ChatIconButton(icon: Icon(FontAwesomeIcons.plusSquare)),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Container(
                        child: TextField(
                      // 이 속성은 ? 영역을 필요로 하는가 ?
                      controller: _textEditingController,
                      maxLines: 1, // 옆으로 길어질듯 ?
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      onSubmitted: _handleSubmitted, // 이 옵션 공부좀
                    )),
                  ),
                  const ChatIconButton(
                      icon: Icon(FontAwesomeIcons.smile)), // 위에 익스펜디드가 영역 다 먹음
                  const ChatIconButton(icon: Icon(FontAwesomeIcons.cog)),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(text) {
    _textEditingController.clear(); // 전송하면 비워줌

    setState(() {
      chats.add(
        // 생성자로 만들고 추가 - 다시그림 )
        MyChat(
          text: text,
          time: DateFormat("a k:m")
              .format(DateTime.now()) // "a k:m" 은 뭐임 ? - int 패키지를 이용한 날짜 포맷 ?
              .replaceAll("AM", "오전")
              .replaceAll("PM", "오후"),
        ),
      );
    });
  }
}
