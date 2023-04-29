import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumFormField extends StatefulWidget {
  const NumFormField({
    super.key,
    required this.hintText,
    required this.prefixText,
    required this.controller,
  });

  final hintText;
  final prefixText;
  final controller;

  @override
  _NumFormFieldState createState() => _NumFormFieldState();
}

class _NumFormFieldState extends State<NumFormField> {
  late String hintText;
  late String prefixText;

  @override
  void initState() {
    super.initState();
    hintText = widget.hintText;
    prefixText = widget.prefixText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.phone,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              // 인풋과 박스의| 차이는 ?
              contentPadding:
                  const EdgeInsets.only(top: 34, left: 20, bottom: 10),
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
