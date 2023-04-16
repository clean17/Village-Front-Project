import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class JusoSearchPage extends StatefulWidget {
  const JusoSearchPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<JusoSearchPage> createState() => _JusoSearchPageState();
}

class _JusoSearchPageState extends State<JusoSearchPage> {
  final TextEditingController _AddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  AddressText(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget AddressText() {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _addressAPI(); // 카카오 주소 API
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('주소',
              style: TextStyle(fontSize: 15, color: Colors.blueGrey)),
          TextFormField(
            enabled: false,
            decoration: const InputDecoration(
              isDense: false,
            ),
            controller: _AddressController,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  _addressAPI() async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );
    _AddressController.text =
        '${model.zonecode!} ${model.address!} ${model.buildingName!}';
  }
}
