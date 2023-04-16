import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
<<<<<<< HEAD
import 'package:village/view/pages/host/host_place_resister_page.dart';
=======
import 'package:village/view/pages/test/json_parse.dart';
>>>>>>> ef24334 (http get 요청 확인)

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
<<<<<<< HEAD
      home: const HostPlaceResisterPage(), // 클래스 분리
=======
      home: const JsonParse(), // 클래스 분리
>>>>>>> ef24334 (http get 요청 확인)
      // home: Scaffold(
      //   body: Container(
      //     child: const PlaceDetailPage(),
      //   ),
    );
  }
}
