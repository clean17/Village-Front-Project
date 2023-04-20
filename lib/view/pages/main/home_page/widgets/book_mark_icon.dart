import 'package:flutter/material.dart';

class BookMarkIcon extends StatefulWidget {
  const BookMarkIcon({Key? key}) : super(key: key);

  @override
  State<BookMarkIcon> createState() => _BookMarkIconState();
}

class _BookMarkIconState extends State<BookMarkIcon> {

  bool _isBookmarked = false;

  void _toggleBookmark(){
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleBookmark,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Row(
          children: [
            Icon(
              _isBookmarked ? Icons.bookmark : Icons.bookmark_border, // 눌렀을 때 아이콘 변경
              size: 18,
              color: _isBookmarked? Colors.red : null, // 눌렀을 때 색상 변경
            ),
          ],
        ),
      ),
    );
  }
}