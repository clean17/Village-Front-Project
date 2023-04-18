// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:village/view/pages/test/my_home_page.dart';

// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           // primaryColor: Colors.white,
//           ),
//       debugShowCheckedModeBanner: false, // 화면에 디버그 제거
//       home: const HomeScreen(), // 클래스 분리

//       // JusoSearchPage 주소 검색페이지
//       // JsonParse() http get요청 연습
//       // home: Scaffold(
//       //   body: Container(
//       //     child: const PlaceDetailPage(),
//       //   ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:village/view/pages/map/map_nearby_place_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final status = await Geolocator.checkPermission();
  if (status == LocationPermission.denied) {
    await Geolocator.requestPermission();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primaryColor: Colors.white,
          ),
      debugShowCheckedModeBanner: false, // 화면에 디버그 제거
      home: const MapNearbyPlacePage(), // 클래스 분리
      // JusoSearchPage 주소 검색페이지
      // JsonParse() http get요청 연습
      // home: Scaffold(
      //   body: Container(
      //     child: const PlaceDetailPage(),
      //   ),
    );
  }
}
