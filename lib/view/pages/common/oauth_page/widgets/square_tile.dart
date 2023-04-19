import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String? imagePath;
  final Function? press;

  const SquareTile({Key? key, required this.imagePath, this.press})
      : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(imagePath!, height: 50, width: 50),
        ),
      ),
    );
  }
}
