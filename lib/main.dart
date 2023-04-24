import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/model/user/user_repository.dart';
import 'package:village/provider/session_provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SessionUser sessionUser = await UserRepository().fetchJwtVerify();

  runApp(
    ProviderScope(
      overrides: [sessionProvider.overrideWithValue(sessionUser)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // navigatorKey.currentContext; 글로벌키를 이용하면 컨텍스트 어디서든 접근
    SessionUser sessionUser = ref.read(sessionProvider);
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Move.splashPage,
      routes: getRouters(),
      // home: ScrollablePositionedListExample(),
      // home: ChipApp(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:http/http.dart' as http;

// GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// // 안드로이드 에뮬레이터(가상 디바이스)에서는 localhost(127.0.0.1)을 사용할 수 없음
// // 10.0.2.2는 안드로이드 에뮬레이터에서 호스트 컴퓨터를 가리키는 가상 IP 주소임
// String serverUrl = "http://10.0.2.2:8080/fcm/token"; // 서버 주소

// class _HomePageState extends State<HomePage> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   @override
//   void initState() {
//     super.initState();

//     // FCM 토큰 가져오기
//     _firebaseMessaging.getToken().then((token) {
//       print('FCM Token: $token');

//       sendTokenToServer(token!);
//     });

//     // FCM 메시지 수신 이벤트 등록
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print(message);
//       print("FCM Message Received: ${message.notification?.body}");
//     });
//   }

//   // APP을 실행하였을 때 FCM 토큰을 Server로 보내기 위한 메서드
//   void sendTokenToServer(String token) async {
//     try {
//       final response = await http.post(
//         Uri.parse(serverUrl),
//         body: {
//           "token": token,
//         },
//       );
//       if (response.statusCode == 200) {
//         print("Token sent successfully");
//       } else {
//         print("Failed to send token");
//       }
//     } catch (e) {
//       print("Error sending token: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }
