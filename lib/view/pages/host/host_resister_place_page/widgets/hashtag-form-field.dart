import 'package:flutter/material.dart';
import 'package:village/view/pages/search/search_keyword_page/widgets/my_search_keyword.dart';

class HashtagFormField extends StatefulWidget {
  final prefixText;
  final hintText;
  const HashtagFormField(
      {super.key, required this.prefixText, required this.hintText});

  @override
  State<HashtagFormField> createState() => _HashtagFormFieldState();
}

class _HashtagFormFieldState extends State<HashtagFormField> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _inputHistory = [];

  void _removeKeyword(String keyword) {
    setState(() {
      _inputHistory.remove(keyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Stack(
            children: [
              TextFormField(
                  controller: _textController,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    // 인풋과 박스의| 차이는 ?
                    contentPadding:
                        const EdgeInsets.only(top: 30, left: 20, bottom: 10),
                    hintText: widget.hintText,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  onFieldSubmitted: (String input) {
                    setState(() {
                      _inputHistory.add('#$input');
                    });
                    _textController.clear();
                  }),
              Positioned(
                top: 8,
                left: 20,
                child: Text(
                  widget.prefixText,
                  style: const TextStyle(fontSize: 10), // ???
                ),
              ),
            ],
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
