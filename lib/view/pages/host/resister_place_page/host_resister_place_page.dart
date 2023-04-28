import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/core/utils/show_toast.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/host_resister_body.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/resister_appbar.dart';
import 'package:village/view/pages/map/juso_search_page/juso_search_page_view_model.dart';
import 'package:village/view/widgets/custom_bottom_button.dart';

class HostResisterPlacePage extends ConsumerWidget {
  HostResisterPlacePage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _detail = TextEditingController();
  final _notice = TextEditingController();
  final _intro = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ResisterAppbar(),
      body: HostResisterBody(
        formkey: _formKey,
        detail: _detail,
        intro: _intro,
        notice: _notice,
        title: _title,
      ),
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
                funPress: () {
                  // if (_formKey.currentState!.validate()) {
                  // String x = ref
                  //     .read(jusoSearchPageProvider)!
                  //     .addressModel!
                  //     .documents[0]
                  //     .x;
                  // String y = ref
                  //     .read(jusoSearchPageProvider)!
                  //     .addressModel!
                  //     .documents[0]
                  //     .y;
                  showToast(ref
                      .read(jusoSearchPageProvider)!
                      .addressModel!
                      .documents[0]
                      .x);
                  // Logger().d(ref
                  //     .read(jusoSearchPageProvider)!
                  //     .addressModel!
                  //     .documents[0]
                  //     .x);
                  // ref.read(placeControllerProvider).save(
                  //     _title.text, _detail.text, _intro.text, _notice.text);
                  // }
                  Logger().d('실패');
                }),
          ],
        ),
      ),
    );
  }
}
