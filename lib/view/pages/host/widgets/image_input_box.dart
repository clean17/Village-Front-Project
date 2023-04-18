import 'package:flutter/material.dart';

class ImageInputBox extends StatelessWidget {
  const ImageInputBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 120),
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black38),
              borderRadius: BorderRadius.circular(10)),
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 40, maxWidth: 30),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('이미지 추가')))),
    );
  }
}
