import 'package:flutter/material.dart';

class AddressFormField extends StatelessWidget {
  final prefixText;
  final hintText;
  const AddressFormField(
      {super.key, required this.prefixText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, left: 20, bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.black38),
            ),
          ),
          const Positioned(
            top: 8,
            left: 20,
            child: Text(
              '주소 입력',
              style: TextStyle(fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
