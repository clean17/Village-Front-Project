import 'package:flutter/material.dart';
import 'package:village/view/pages/map/juso_search_page/widgets/address_text.dart';

class JusoSearchPage extends StatelessWidget {
  const JusoSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.black38),
            ),
            child: const AddressText(),
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
