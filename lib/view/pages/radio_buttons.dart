import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Radio Button",
      debugShowCheckedModeBanner: false,
      home: RadioButtons(),
    );
  }
}

class RadioButtons extends StatefulWidget {
  const RadioButtons({Key? key}) : super(key: key);

  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

enum String { highCost, lowCost, highRate }

class _RadioButtonsState extends State<RadioButtons> {
  String _string = String.highCost; // 라디오 버튼의 선택 초기화

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio Button"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            RadioListTile(
              title: const Text("높은 가격순"),
              // activeColor: Colors.red,
              value: String.highCost,
              groupValue: _string,
              onChanged: (String? value) {
                setState(() {
                  _string = value!;
                });
              },
            ),
            RadioListTile(
              title: const Text("낮은 가격순"),
              value: String.lowCost,
              groupValue: _string,
              onChanged: (String? value) {
                setState(() {
                  _string = value!;
                });
              },
            ),
            RadioListTile(
              title: const Text("리뷰평점순"),
              value: String.highRate,
              groupValue: _string,
              onChanged: (String? value) {
                setState(() {
                  _string = value!;
                  print(_string.name); // _char 에 담긴 값은 이렇게
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
