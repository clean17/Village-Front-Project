import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';

class UserSearchKeyword extends StatefulWidget {
  const UserSearchKeyword({
    Key? key,
    required this.text,
    required this.onDelete,
  }) : super(key: key);

  final String text;
  final VoidCallback onDelete;

  @override
  _UserSearchKeywordState createState() => _UserSearchKeywordState();
}

class _UserSearchKeywordState extends State<UserSearchKeyword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.only(top: 3, bottom: 6, left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
            style: mwhite_bold_text,
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: widget.onDelete,
            child: const Icon(
              Icons.clear,
              size: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
