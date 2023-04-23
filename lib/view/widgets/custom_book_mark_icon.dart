import 'package:flutter/material.dart';

class CustomBookMarkIcon extends StatefulWidget {
  const CustomBookMarkIcon(
      {Key? key, this.color = Colors.black, this.size = 18})
      : super(key: key);
  final color;
  final double size;

  @override
  State<CustomBookMarkIcon> createState() => _CustomBookMarkIconState();
}

class _CustomBookMarkIconState extends State<CustomBookMarkIcon> {
  bool _isBookmarked = false;
  late Color color;
  late double size;
  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    color = widget.color;
    size = widget.size;
    return InkWell(
      onTap: _toggleBookmark,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Row(
          children: [
            Icon(
              _isBookmarked
                  ? Icons.bookmark
                  : Icons.bookmark_border, // 눌렀을 때 아이콘 변경
              size: size,
              color: _isBookmarked ? Colors.red : color, // 눌렀을 때 색상 변경
            ),
          ],
        ),
      ),
    );
  }
}
