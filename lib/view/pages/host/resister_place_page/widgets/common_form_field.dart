import 'package:flutter/material.dart';

class CommonFormField extends StatelessWidget {
  final prefixText;
  final hintText;
  final controller;

  const CommonFormField({
    super.key,
    required this.prefixText,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return '$prefixText를 입력하세요';
              }
              return null;
            },
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              // 인풋과 박스의| 차이는 ?
              contentPadding:
                  const EdgeInsets.only(top: 30, left: 20, bottom: 10),
              hintText: hintText,
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
          ),
          Positioned(
            top: 8,
            left: 20,
            child: Text(
              prefixText,
              style: const TextStyle(fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
