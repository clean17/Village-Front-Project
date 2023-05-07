import 'package:flutter/material.dart';
import 'package:village/view/pages/payment/bootpay_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
  // runApp(FirstRoute());
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('결제 route로 이동'),
          onPressed: () {
            // 눌렀을 때 두 번째 route로 이동합니다.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BootpayPage()),
            );
          },
        ),
      ),
    );
  }
}
