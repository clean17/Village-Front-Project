import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:village/controller/map_controller.dart';
import 'package:village/view/pages/map/juso_search_page/juso_search_page_view_model.dart';

class AddressText extends ConsumerWidget {
  AddressText({super.key});
  final TextEditingController _AddressController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _addressAPI(context, ref); // 카카오 주소 API
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            enabled: false,
            decoration: const InputDecoration(
              hintText: '주소를 입력하세요',
              isDense: false,
              border: InputBorder.none, // 밑줄을 없앱니다.
            ),
            controller: _AddressController,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  _addressAPI(context, ref) async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );
    _AddressController.text = '${model.address!} ${model.buildingName!}';
    // 1. 우편주소를 프로바이더에 넣는다.
    ref.read(jusoSearchPageProvider.notifier).notifyAddKopo(model);
    // 2. 도로명주소로 위,경도를 요청후 프로바이더에 넣는다.
    // 2시간동안 await 안 적어서 왜 null 인지 삽질함 ;;
    await ref.read(mapControllerProvider).addressReq(model.address);
    JusoSearchPageModel test = ref.read(jusoSearchPageProvider);
    // Logger().d(test.addressModel!.documents[0].x);
  }
}
