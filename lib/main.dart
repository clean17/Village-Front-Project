import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/search/search_keyword_page.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // 화면에 디버그 제거
      home: SearchKeywordPage(), // 클래스 분리
      // home: Scaffold(
      //   body: Container(
      //     child: const PlaceDetailPage(),
      //   ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late final ScrollController _scrollController;
//   final List<String> _tabs = ['Tab 1', 'Tab 2', 'Tab 3', 'Tab 4'];

//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('My App'),
//         ),
//         body: ListView.builder(
//           controller: _scrollController,
//           itemCount: 100,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text('Item $index'),
//             );
//           },
//         ),
//         bottomNavigationBar: Stack(
//           children: [
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: 50,
//                 color: Colors.white,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     for (int i = 0; i < _tabs.length; i++)
//                       GestureDetector(
//                         onTap: () {
//                           _scrollController.animateTo(
//                             i * 100.0,
//                             duration: const Duration(milliseconds: 500),
//                             curve: Curves.easeInOut,
//                           );
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Text(
//                             _tabs[i],
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
