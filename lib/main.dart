import 'package:bootpay/api/api_provider.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/config/bootpay_config.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/stat_item.dart';
import 'package:bootpay/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/model/user/user_repository.dart';
import 'package:village/provider/session_provider.dart';
=======
>>>>>>> cae2c5a (부트페이 연습)

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
<<<<<<< HEAD
  Widget build(BuildContext context, WidgetRef ref) {
    // navigatorKey.currentContext; 글로벌키를 이용하면 컨텍스트 어디서든 접근
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
      // home: ScrollablePositionedListExample(),
      // home: ChipApp(),
=======
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
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
>>>>>>> cae2c5a (부트페이 연습)
    );
  }
}

<<<<<<< HEAD
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
=======
class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  Payload payload = Payload();

  String webApplicationId = '643fc8c0755e27001ae57d20';
  String androidApplicationId = '643fc8c0755e27001ae57d21';
  String iosApplicationId = '643fc8c0755e27001ae57d22';

  String get applicationId {
    return Bootpay().applicationId(
        webApplicationId, androidApplicationId, iosApplicationId);
  }

  @override
  void initState() {
    super.initState();
    bootpayAnalyticsUserTrace(); //통계용 함수 호출
    bootpayAnalyticsPageTrace(); //통계용 함수 호출
    bootpayReqeustDataInit(); //결제용 데이터 init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return Container(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: TextButton(
                    onPressed: () => goBootpayTest(context),
                    child: const Text('일반결제 테스트'),
                  ),
                ),
                const SizedBox(height: 10),
                // Center(
                //   child: TextButton(
                //     onPressed: () => goBootpaySubscriptionUITest(context),
                //     child: const Text('비인증 정기결제 테스트 (부트페이 UI)'),
                //   ),
                // ),
                const SizedBox(height: 10),
                // Center(
                //   child: TextButton(
                //     onPressed: () => goBootpaySubscriptionTest(context),
                //     child: const Text('인증 정기결제 테스트 (PG사 UI)'),
                //   ),
                // ),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () => goBootpayAuthTest(context),
                    child: const Text('본인인증 테스트'),
                  ),
                ),
                // SizedBox(height: 10),
                // Center(
                //   child: TextButton(
                //     onPressed: () => goBootpayPassword(context),
                //     child: Text('비밀번호 결제테스트'),
                //   ),
                // ),
              ],
            ),
          ),
        );
      }),
    );
  }

  final ApiProvider _provider = ApiProvider();

  User generateUser() {
    var user = User();
    user.id = '123411aaaaaaaaaaaabd4ss11';
    user.gender = 1;
    user.email = 'test1234@gmail.com';
    user.phone = '01012345678';
    user.birth = '19880610';
    user.username = '홍길동';
    user.area = '서울';
    return user;
  }

  //통계용 함수
  bootpayAnalyticsUserTrace() async {
    await Bootpay().userTrace(
        id: 'user_1234',
        email: 'user1234@gmail.com',
        gender: -1,
        birth: '19941014',
        area: '서울',
        applicationId: applicationId);
  }

  //통계용 함수
  bootpayAnalyticsPageTrace() async {
    StatItem item1 = StatItem();
    item1.itemName = "미키 마우스"; // 주문정보에 담길 상품명
    item1.unique = "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
    item1.price = 500; // 상품의 가격
    item1.cat1 = '컴퓨터';
    item1.cat2 = '주변기기';

    StatItem item2 = StatItem();
    item2.itemName = "키보드"; // 주문정보에 담길 상품명
    item2.unique = "ITEM_CODE_KEYBOARD"; // 해당 상품의 고유 키
    item2.price = 500; // 상품의 가격
    item2.cat1 = '컴퓨터';
    item2.cat2 = '주변기기';

    List<StatItem> items = [item1, item2];

    await Bootpay().pageTrace(
        url: 'main_1234',
        pageType: 'sub_page_1234',
        applicationId: applicationId,
        userId: 'user_1234',
        items: items);
  }

  //결제용 데이터 init
  bootpayReqeustDataInit() {
    Item item1 = Item();
    item1.name = "미키 '마우스"; // 주문정보에 담길 상품명
    item1.qty = 1; // 해당 상품의 주문 수량
    item1.id = "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
    item1.price = 500; // 상품의 가격

    Item item2 = Item();
    item2.name = "키보드"; // 주문정보에 담길 상품명
    item2.qty = 1; // 해당 상품의 주문 수량
    item2.id = "ITEM_CODE_KEYBOARD"; // 해당 상품의 고유 키
    item2.price = 500; // 상품의 가격
    List<Item> itemList = [item1, item2];

    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId =
        androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id

    payload.pg = '나이스페이';
    payload.method = '네이버페이';
    // payload.methods = ['카드', '휴대폰', '가상계좌', '계좌이체', '카카오페이'];
    payload.orderName = "테스트 상품"; //결제할 상품명
    payload.price = 1000.0; //정기결제시 0 혹은 주석

    payload.orderId = DateTime.now()
        .millisecondsSinceEpoch
        .toString(); //주문번호, 개발사에서 고유값으로 지정해야함

    payload.metadata = {
      "callbackParam1": "value12",
      "callbackParam2": "value34",
      "callbackParam3": "value56",
      "callbackParam4": "value78",
    }; // 전달할 파라미터, 결제 후 되돌려 주는 값
    payload.items = itemList; // 상품정보 배열

    User user = User(); // 구매자 정보
    user.username = "사용자 이름";
    user.email = "user1234@gmail.com";
    user.area = "서울";
    // user.phone = "010-0000-0000";
    user.addr = 'null';

    Extra extra = Extra(); // 결제 옵션
    extra.appScheme = 'bootpayFlutterExample';

    if (BootpayConfig.ENV == -1) {
      payload.extra?.redirectUrl = 'https://dev-api.bootpay.co.kr/v2';
    } else if (BootpayConfig.ENV == -2) {
      payload.extra?.redirectUrl = 'https://stage-api.bootpay.co.kr/v2';
    } else {
      payload.extra?.redirectUrl = 'https://api.bootpay.co.kr/v2';
    }

    // extra.cardQuota = '3';
    // extra.openType = 'popup';

    // extra.carrier = "SKT,KT,LGT"; //본인인증 시 고정할 통신사명
    // extra.ageLimit = 20; // 본인인증시 제한할 최소 나이 ex) 20 -> 20살 이상만 인증이 가능

    payload.user = user;
    payload.items = itemList;
    payload.extra = extra;
    // payload.extra?.openType = "iframe";
  }

  //버튼클릭시 부트페이 결제요청 실행
  void goBootpayTest(BuildContext context) {
    if (kIsWeb) {
      //flutter web은 cors 이슈를 설정으로 먼저 해결해주어야 한다.
      payload.extra?.openType = 'iframe';
    }
    // print('popup');
    // payload.extra?.openType = 'popup';

    payload.pg = '이니시스';
    payload.method = "카드";

    Bootpay().requestPayment(
      context: context,
      payload: payload,
      showCloseButton: false,
      // closeButton: Icon(Icons.close, size: 35.0, color: Colors.black54),
      onCancel: (String data) {
        print('------- onCancel 1 : $data');
      },
      onError: (String data) {
        print('------- onError: $data');
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context); //명시적으로 부트페이 뷰 종료 호출
        //TODO - 원하시는 라우터로 페이지 이동
      },
      onIssued: (String data) {
        print('------- onIssued: $data');
      },
      onConfirm: (String data) {
        // checkQtyFromServer(data, context).then((value) => print(1243));
        // await check

        print('------- onConfirm: $data');

        // checkQtyFromServer(data);
        return true;
      },
      // onConfirmAsync: (String data) async {
      //   print('------- onConfirmAsync11: $data');
      //   /**
      //       1. 바로 승인하고자 할 때
      //       return true;
      //    **/
      //   /***
      //       2. 비동기 승인 하고자 할 때
      //       checkQtyFromServer(data);
      //       return false;
      //    ***/
      //   /***
      //       3. 서버승인을 하고자 하실 때 (클라이언트 승인 X)
      //       return false; 후에 서버에서 결제승인 수행
      //    */
      //
      //   await checkQtyFromServer(data);
      //   print('------- onConfirmAsync22: $data');
      //   // return true;
      //   // return true;
      //   return true;
      // },
      onDone: (String data) {
        print('------- onDone: $data');
      },
    );
  }

  void goBootpayAuthTest(BuildContext context) {
    payload.pg = "다날";
    payload.method = "본인인증";
    payload.authenticationId = DateTime.now()
        .millisecondsSinceEpoch
        .toString(); //주문번호, 개발사에서 고유값으로 지정해야함
    // payload.extra?.show
    // payload.extra?.ageLimit = 40;

    Bootpay().requestAuthentication(
      context: context,
      payload: payload,
      showCloseButton: false,
      // closeButton: Icon(Icons.close, size: 35.0, color: Colors.black54),
      onCancel: (String data) {
        print('------- onCancel: $data');
      },
      onError: (String data) {
        print('------- onError: $data');
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context); //명시적으로 부트페이 뷰 종료 호출
        //TODO - 원하시는 라우터로 페이지 이동
      },
      onIssued: (String data) {
        print('------- onIssued: $data');
      },
      onConfirm: (String data) {
        /**
            1. 바로 승인하고자 할 때
            return true;
         **/
        /***
            2. 비동기 승인 하고자 할 때
            checkQtyFromServer(data);
            return false;
         ***/
        /***
            3. 서버승인을 하고자 하실 때 (클라이언트 승인 X)
            return false; 후에 서버에서 결제승인 수행
         */

        checkQtyFromServer(data);
        return false;
      },
      onDone: (String data) {
        print('------- onDone: $data');
      },
    );
  }

  Future<void> checkQtyFromServer(String data) async {
    //TODO 서버로부터 재고파악을 한다
    print('checkQtyFromServer start: $data');
    return Future.delayed(const Duration(seconds: 1), () {
      print('checkQtyFromServer end: $data');

      Bootpay().transactionConfirm();
      return true;
    });
  }
}
>>>>>>> cae2c5a (부트페이 연습)
