import 'package:flutter/material.dart';

class HostHeader extends StatelessWidget {
  const HostHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              print("호스트화면");
            },
            child: Text(
              "호스트페이지",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              print("마이페이지");
            },
            child: Text(
              "마이 페이지",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
