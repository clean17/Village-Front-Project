import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/model/user/user_repository.dart';
import 'package:village/provider/session_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:village/view/pages/test/my_home_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//   runApp(const MyApp());

//   print("Handling a background message: ${message.messageId}");
// }

final applicationStateProvider =
    ChangeNotifierProvider((ref) => ApplicationState());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

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
    final appState = ref.watch(applicationStateProvider);
    SessionUser sessionUser = ref.read(sessionProvider);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Move.splashPage,
      routes: getRouters(),
    );
    // home: ScrollablePositionedListExample(),
    // home: ChipApp(),
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

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Consumer<ApplicationState>(
//           builder: (context, appState, _) => Column(
//             children: <Widget>[
//               const Image(
//                   image: AssetImage('assets/fcm_horizontal_lockup_light.png')),
//               Visibility(
//                 visible: appState.messagingAllowed,
//                 child: Column(
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Click the "Subscribe To Weather" button below to subscribe to the'
//                         ' "weather" topic. Messages sent to the weather topic will be'
//                         ' received.',
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('FCM Token: ${appState.fcmToken}'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => appState.subscribeToTopic('weather'),
//                       child: const Text('Subscribe To Weather'),
//                     ),
//                   ],
//                 ),
//               ),
//               Visibility(
//                 visible: !appState.messagingAllowed,
//                 child: Column(
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Thi quickstart requires notification permissions to be'
//                         ' activated.',
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => appState.requestMessagingPermission(),
//                       child: const Text('Request Notification Permission'),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  late FirebaseMessaging firebaseMessaging;

  String _fcmToken = '';
  String get fcmToken => _fcmToken;

  bool _messagingAllowed = false;
  bool get messagingAllowed => _messagingAllowed;

  Future<void> init() async {
    await Firebase.initializeApp(
        // options: DefaultFirebaseOptions.currentPlatform,
        );

    firebaseMessaging = FirebaseMessaging.instance;

    firebaseMessaging.onTokenRefresh.listen((token) {
      _fcmToken = token;
      debugPrint(token);
      notifyListeners();
      // If necessary send token to application server.

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    });

    // Replace this with your key for web apps.
    const vapidKey = '';
    firebaseMessaging.getToken(vapidKey: vapidKey).then((token) {
      print(token);
      if (token != null) {
        _fcmToken = token;
        debugPrint(token);
        notifyListeners();
      }
    });

    firebaseMessaging.getNotificationSettings().then((settings) {
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        _messagingAllowed = true;
        notifyListeners();
      }
    });

    FirebaseMessaging.onMessage.listen((remoteMessage) {
      debugPrint('Got a message in the foreground');
      debugPrint('message data: ${remoteMessage.data}');

      if (remoteMessage.notification != null) {
        debugPrint('message is a notification');
        // On Android, foreground notifications are not shown, only when the app
        // is backgrounded.
      }
    });
  }

  Future<void> requestMessagingPermission() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _messagingAllowed = true;
      notifyListeners();
    }

    debugPrint('Users permission status: ${settings.authorizationStatus}');
  }

  Future<void> subscribeToTopic(String topic) async {
    await firebaseMessaging.subscribeToTopic(topic);
  }
}
