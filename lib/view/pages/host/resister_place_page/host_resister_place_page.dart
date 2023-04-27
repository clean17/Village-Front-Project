import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/host_resister_body.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/resister_appbar.dart';
import 'package:village/view/widgets/custom_bottom_button.dart';

class HostResisterPlacePage extends ConsumerWidget {
  const HostResisterPlacePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ResisterAppbar(),
      body: HostResisterBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomBottomButton(
                mWeith: getScreenWidth(context) * 0.5,
                text: '임시저장',
                funPress: null),
            CustomBottomButton(
                mWeith: getScreenWidth(context) * 0.5,
                text: '등록',
                funPress: null),
          ],
        ),
      ),
    );
  }
}
