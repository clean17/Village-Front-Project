import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/widgets/test/input_history.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primaryColor: Colors.white,
          ),
      debugShowCheckedModeBanner: false, // 화면에 디버그 제거
      home: const InputHistoryWidget(), // 클래스 분리
      // home: Scaffold(
      //   body: Container(
      //     child: const PlaceDetailPage(),
      //   ),
    );
  }
}
