import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/payment/bootpay_page_view_model.dart';

class PaySuccesPage extends ConsumerWidget {
  const PaySuccesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pm = ref.watch(bootpayProvider);
    String orderId = pm?.bootpayModel.data?.orderId ?? "";
    String placeName = pm?.bootpayModel.data?.orderName ?? "";
    int cost = pm?.bootpayModel.data?.price ?? 0;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/your_image.png'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Icon(
                    Icons.check_circle,
                    color: Colors.lightGreen,
                    size: 120,
                  ),
                ],
              ),
            ),
          ),
          const Text(
            '결제에 성공하였습니다.',
            style: mxlarge_black_text,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '주문번호 : $orderId',
            style: mblack_text,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            '장소 : $placeName',
            style: mblack_text,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            '결제금액 : $cost',
            style: mblack_text,
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.lightGreen, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: SizedBox(
              width: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.lightGreen,
                  ),
                  Text(
                    '돌아가기',
                    style: mlarge_black_text,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
