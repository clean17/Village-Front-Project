import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/dummy/scrapstatus.dart';
import 'package:village/view/pages/user/host_apply_page/user_apply_host_page.dart';
import 'package:village/view/pages/user/my_page/widgets/host_status_chip.dart';

class MyPageScrap extends StatelessWidget {
  final ScrapStatus scrapStatus = ScrapStatus.wait;

  const MyPageScrap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserApplyHostPage(),
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "호스트신청",
                style: mblack_text,
              ),
              SizedBox(width: 10),
              _getHostStatusChip(scrapStatus),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 17,
          ),
        ],
      ),
    );
  }

  Widget _getHostStatusChip(ScrapStatus scrapStatus) {
    switch (scrapStatus) {
      case ScrapStatus.none:
        return SizedBox();
      case ScrapStatus.wait:
        return HostStatusChip(label: "신청중", color: Colors.green);
      case ScrapStatus.deny:
        return HostStatusChip(label: "거절", color: Colors.red);
      case ScrapStatus.sign:
        return HostStatusChip(label: "신청완료", color: Colors.blue);
      default:
        return Container(); // 예외 처리
    }
  }
}
