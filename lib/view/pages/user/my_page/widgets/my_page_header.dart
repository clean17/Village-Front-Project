import 'package:flutter/material.dart';
import 'package:village/view/pages/host/host_info_page/host_info_page.dart';

class MyPageHeader extends StatelessWidget {
  const MyPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "마이페이지",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HostInfoPage(),
                  ));
            },
            child: Text(
              "호스트페이지",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
