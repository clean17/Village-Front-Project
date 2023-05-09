import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/provider/session_provider.dart';
import 'package:village/view/pages/host/host_info_page/host_info_page.dart';

class MyPageHeader extends ConsumerWidget {
  const MyPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionProvider);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "마이페이지",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HostInfoPage(),
                  ));
            },
            child: sessionUser.user?.role == 'HOST'
                ? const Text(
                    "호스트페이지",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )
                : const SizedBox(
                    width: 1,
                  ),
          ),
        ],
      ),
    );
  }
}
