import 'package:flutter/material.dart';
import 'package:village/view/pages/search/keyword_page/widgets/my_search_keyword.dart';

class InputHistoryWidget extends StatefulWidget {
  const InputHistoryWidget({super.key});

  @override
  _InputHistoryWidgetState createState() => _InputHistoryWidgetState();
}

class _InputHistoryWidgetState extends State<InputHistoryWidget> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _inputHistory = [];

  void _removeKeyword(String keyword) {
    setState(() {
      _inputHistory.remove(keyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input History'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: '해시태그를 입력하세요',
              ),
              onSubmitted: (String input) {
                setState(() {
                  _inputHistory.add('#$input');
                });
                _textController.clear();
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 0,
                runSpacing: 0,
                children: _inputHistory.map((keyword) {
                  return MySearchKeyword(
                    text: keyword,
                    onDelete: () {
                      _removeKeyword(keyword);
                    },
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
