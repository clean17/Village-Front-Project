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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/model/bootpay/bootpay_model.dart';
import 'package:village/provider/picker_provier.dart';
import 'package:village/view/pages/payment/bootpay_page_view_model.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';
import 'package:village/view/pages/place/detail_page/place_detail_reservation_view_model.dart';

class BootpayPage extends ConsumerStatefulWidget {
  const BootpayPage({super.key});

  @override
  ConsumerState<BootpayPage> createState() => _BootpayPageState();
}

class _BootpayPageState extends ConsumerState<BootpayPage> {
  Payload payload = Payload();

  String webApplicationId = '643fc8c0755e27001ae57d20';
  String androidApplicationId = '643fc8c0755e27001ae57d21';
  String iosApplicationId = '643fc8c0755e27001ae57d22';
  String title = '';
  double cost = 0;

  String get applicationId {
    return Bootpay().applicationId(
        webApplicationId, androidApplicationId, iosApplicationId);
  }

  @override
  void initState() {
    // setting();
    super.initState();
    bootpayAnalyticsUserTrace(); //통계용 함수 호출
    bootpayAnalyticsPageTrace(); //통계용 함수 호출
    bootpayReqeustDataInit(); //결제용 데이터 init
  }

  void setting() {
    final ppm = ref.watch(placeReservationProvider);
    title = ppm?.reservation?.place.title ?? "";

    PickerModel? pickermodel = ref.watch(pickerProvider);
    PlaceDetailPageModel pm = ref.watch(placeDetailPageProvider);
    DateTime reservationDate = pickermodel?.reservationDate ?? DateTime.now();
    DateTime startTime = pickermodel?.startTime ?? DateTime.now();
    DateTime endTime = pickermodel?.endTime ?? DateTime.now();
    DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    DateFormat timeFormatter = DateFormat('HH:mm');
    String startT = timeFormatter.format(startTime);
    String endT = timeFormatter.format(endTime);

    cost = (double.parse(endT.split(':').first) -
            double.parse(startT.split(':').first)) *
        pm.place!.pricePerHour;
  }

  @override
  Widget build(BuildContext context) {
    // final sessionUser = ref.read(sessionProvider);
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
                // Center(
                //   child: TextButton(
                //     onPressed: () => goBootpayAuthTest(context),
                //     child: const Text('본인인증 테스트'),
                //   ),
                // ),
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
    item1.itemName = title; // 주문정보에 담길 상품명
    item1.unique = "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
    //
    //
    //
    //
    item1.price = 100; // 상품의 가격
    item1.cat1 = '컴퓨터';
    item1.cat2 = '주변기기';

    List<StatItem> items = [item1];

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
    item1.name = 'dd'; // 주문정보에 담길 상품명
    item1.qty = 1; // 해당 상품의 주문 수량
    item1.id = "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
    //
    //
    //
    //
    item1.price = 100; // 상품의 가격

    List<Item> itemList = [item1];

    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId =
        androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id

    payload.pg = '나이스페이';
    payload.method = '네이버페이';
    // payload.methods = ['카드', '휴대폰', '가상계좌', '계좌이체', '카카오페이'];
    payload.orderName = "테스트"; //결제할 상품명
    //
    //
    //
    //
    payload.price = 100; //정기결제시 0 혹은 주석

    payload.orderId = DateTime.now()
        .millisecondsSinceEpoch
        .toString(); //주문번호, 개발사에서 고유값으로 지정해야함

    payload.metadata = {
      "callbackParam1": "결제정보확인",
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
      onDone: (String data) async {
        BootPayModel bootpay = bootPayModelFromJson(data);
        ref.read(bootpayProvider.notifier).notifyAdd(bootpay);
        Logger().d('부트페이 결과 받음');
        print('------- onDone: $data');
        // await Future.delayed(const Duration(seconds: 10));
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.popAndPushNamed(context, Move.mainPage);
      },
    );
  }
}
