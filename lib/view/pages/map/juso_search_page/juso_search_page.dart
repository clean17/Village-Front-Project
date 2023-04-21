import 'package:flutter/material.dart';
import 'package:village/view/pages/map/juso_search_page/widgets/address_text.dart';

class JusoSearchPage extends StatelessWidget {
  const JusoSearchPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, left: 20, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.black38),
            ),
            child: const AddressText(),
          ),
          const Positioned(
            top: 8,
            left: 20,
            child: Text(
              '주소 입력',
              style: TextStyle(fontSize: 10),
            ),
          )
        ],
      ),
    );
  }

//   Widget AddressText() {
//     return GestureDetector(
//       onTap: () {
//         HapticFeedback.mediumImpact();
//         _addressAPI(); // 카카오 주소 API
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//             enabled: false,
//             decoration: const InputDecoration(
//               isDense: false,
//             ),
//             controller: _AddressController,
//             style: const TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }

//   _addressAPI() async {
//     KopoModel model = await Navigator.push(
//       context,
//       CupertinoPageRoute(
//         builder: (context) => RemediKopo(),
//       ),
//     );
//     _AddressController.text =
//     '${model.zonecode!} ${model.address!} ${model.buildingName!}';
//   }
// }
}
