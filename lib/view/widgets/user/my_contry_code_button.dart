import 'package:flutter/material.dart';

class MyContryCodeButton extends StatefulWidget {
  const MyContryCodeButton({Key? key}) : super(key: key);

  @override
  State<MyContryCodeButton> createState() => _MyContryCodeButtonState();
}

class _MyContryCodeButtonState extends State<MyContryCodeButton> {
  List<String> dropdownList = ['대한민국(+82)', '2', '3'];
  String selectedDropdown = '대한민국(+82)';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      width: 360,
      height: 60,
      child: DropdownButton(
        underline: SizedBox.shrink(),
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        elevation: 16,
        value: selectedDropdown,
        items: dropdownList.map((String item) {
          return DropdownMenuItem<String>(
            child: Text(
              '$item',
              style: TextStyle(color: Colors.grey.shade700),
            ),
            value: item,
          );
        }).toList(),
        onChanged: (dynamic value) {
          setState(() {
            selectedDropdown = value;
          });
        },
      ),
    );
  }
}
