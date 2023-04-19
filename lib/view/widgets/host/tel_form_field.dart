import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelFormField extends StatefulWidget {
  const TelFormField({
    super.key,
    required this.hintText,
    required this.prefixText,
  });

  final hintText;
  final prefixText;

  @override
  _TelFormFieldState createState() => _TelFormFieldState();
}

class _TelFormFieldState extends State<TelFormField> {
  final _phoneNumberController = TextEditingController();
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
            controller: _phoneNumberController,
            keyboardType: TextInputType.phone,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
              _PhoneNumberFormatter(),
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

class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    // 입력값에서 숫자만 추출합니다.
    var digits = text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digits.length > 10) {
      digits = digits.substring(0, 11);
    }

    var formatted = '';

    // 3자리마다 하이픈(-)을 추가합니다.
    if (digits.length > 3) {
      formatted += '${digits.substring(0, 3)}-';
      digits = digits.substring(3);
    }

    if (digits.length > 4) {
      formatted += '${digits.substring(0, 4)}-';
      digits = digits.substring(4);
    }

    formatted += digits;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
