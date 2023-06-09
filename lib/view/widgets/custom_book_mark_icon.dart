import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/provider/session_provider.dart';
import 'package:village/view/pages/main/home_page/widgets/book_mark_alert_dialog.dart';

class CustomBookMarkIcon extends ConsumerStatefulWidget {
  const CustomBookMarkIcon(
      {Key? key, this.color = Colors.black, this.size = 18})
      : super(key: key);
  final color;
  final double size;

  @override
  ConsumerState<CustomBookMarkIcon> createState() => _CustomBookMarkIconState();
}

class _CustomBookMarkIconState extends ConsumerState<CustomBookMarkIcon> {
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
    // "ref"는 build 메소드 안에서 프로바이더를 구독(listen)하기위해 사용할 수 있습니다.
    final sessionUser = ref.watch(sessionProvider);

    color = widget.color;
    size = widget.size;
    return InkWell(
        onTap: () {
          if (sessionUser.isLogin!) {
            _toggleBookmark();
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return BookMarkAlertDialog();
              },
            );
          }
        },
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
