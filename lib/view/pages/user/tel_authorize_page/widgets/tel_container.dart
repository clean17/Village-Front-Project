import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:village/view/pages/user/tel_authorize_page/widgets/count_down_timer.dart';


class TelContainer extends StatefulWidget {
  const TelContainer({Key? key}) : super(key: key);

  @override
  State<TelContainer> createState() => _TelContainerState();
}

class _TelContainerState extends State<TelContainer> {
  final _telAuthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 5),
      height: 100,
      width: double.infinity,
      child: Column(
        children: [
          TextFormField(
            controller: _telAuthController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly, // 숫자만 입력 가능
              LengthLimitingTextInputFormatter(6), // 6자로 제한
            ],
            decoration: InputDecoration(
              labelText : "인증번호",
              hintText: "인증번호 6자리를 입력하세요.",
            ),
          ),
          SizedBox(height: 10),
          CountDownTimer(),
        ],
      ),
    );
  }
}