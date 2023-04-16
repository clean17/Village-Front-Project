import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/test/json_parse.dart';

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
      home: const JsonParse(), // 클래스 분리

      // JsonParse() http get요청 연습
      // home: Scaffold(
      //   body: Container(
      //     child: const PlaceDetailPage(),
      //   ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:kpostal/kpostal.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kpostal Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Kpostal Example'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String postCode = '-';
//   String address = '-';
//   String latitude = '-';
//   String longitude = '-';
//   String kakaoLatitude = '-';
//   String kakaoLongitude = '-';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextButton(
//               onPressed: () async {
//                 await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => KpostalView(
//                       useLocalServer: true,
//                       localPort: 1024,
//                       kakaoKey: 'KakaoAK 95d3d9601204b0b1e428998704f27210',
//                       callback: (Kpostal result) {
//                         setState(() {
//                           postCode = result.postCode;
//                           address = result.address;
//                           latitude = result.latitude.toString();
//                           longitude = result.longitude.toString();
//                           kakaoLatitude = result.kakaoLatitude.toString();
//                           kakaoLongitude = result.kakaoLongitude.toString();
//                         });
//                       },
//                     ),
//                   ),
//                 );
//               },
//               style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.blue)),
//               child: const Text(
//                 'Search Address',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(40.0),
//               child: Column(
//                 children: [
//                   const Text('postCode',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   Text('result: $postCode'),
//                   const Text('address',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   Text('result: $address'),
//                   const Text('LatLng',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   Text('latitude: $latitude / longitude: $longitude'),
//                   const Text('through KAKAO Geocoder',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   Text('latitude: $kakaoLatitude / longitude: $kakaoLongitude'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
