import 'package:flutter/material.dart';
import 'package:village/core/color.dart';
import 'package:village/core/style.dart';
import 'package:village/view/widgets/bottom_button.dart';
import 'package:village/view/widgets/host/address_form_field.dart';
import 'package:village/view/widgets/host/common_form_field.dart';
import 'package:village/view/widgets/host/hashtag-form-field.dart';
import 'package:village/view/widgets/host/image_input_box.dart';
import 'package:village/view/widgets/host/people_picker.dart';
import 'package:village/view/widgets/host/place_time_picker.dart';
import 'package:village/view/widgets/host/tel_form_field.dart';
import 'package:village/view/widgets/resister_appbar.dart';

const double _kItemExtent = 32.0;
const List<String> _fruitNames = <String>[
  'Apple',
  'Mango',
  'Banana',
  'Orange',
  'Pineapple',
  'Strawberry',
];

class HostPlaceResisterPage extends StatefulWidget {
  const HostPlaceResisterPage({super.key});

  @override
  State<HostPlaceResisterPage> createState() => _HostPlaceResisterPageState();
}

class _HostPlaceResisterPageState extends State<HostPlaceResisterPage> {
  bool _isButton1Pressed = false;
  bool _isButton2Pressed = false;
  bool _isButton3Pressed = false;
  bool _isButton4Pressed = false;
  bool _isButton5Pressed = false;
  bool _isButton6Pressed = false;
  bool _isButton7Pressed = false;
  final String _selectedItem = 'Item 1';
  final RangeValues _selectedRange = const RangeValues(0, 50);

  final Duration _selectedTime = const Duration(hours: 0, minutes: 0);

  @override
  Widget build(BuildContext context) {
    final double mWeith = MediaQuery.of(context).size.width;
    final double dayWeith = mWeith * 0.11;
    final double mHeight = MediaQuery.of(context).size.height;
    final double dayHeight = mHeight * 0.05;
    return Scaffold(
      appBar: ResisterAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey.shade800,
                    child: const Text('AB'),
                  ),
                  label: const Text('호스트 유저 명 ?'),
                ),
              ),
              const CommonFormField(hintText: '공간명을 입력하세요', prefixText: '제목'),
              // const CustomElevatedButton(
              //   text: '주소입력',
              //   color: kAccentColor,
              // ),
              GestureDetector(
                  onTap: () {
                    // 주소 api 열기
                  },
                  child: const AddressFormField(
                      hintText: '주소를 입력하세요', prefixText: '주소')),
              const TelFormField(hintText: '010-1234-5678', prefixText: '전화번호'),
              const CommonFormField(
                  hintText: '시간당 가격을 입력하세요', prefixText: '시간당  가격'),

              // CupertinoPickerApp(),
              const CommonFormField(
                  hintText: '소개 내용을 입력하세요', prefixText: '장소 소개'),
              const CommonFormField(
                  hintText: '유의 사항을 입력하세요', prefixText: '유의 사항'),
              const CommonFormField(
                  hintText: '선택지를 만들어서 클릭할수 있게', prefixText: '편의 시설'),
              const HashtagFormField(
                  hintText: '#해시태그를 입력하고 , 로 구분하세요', prefixText: '해시태그'),
              const ImageInputBox(),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '요일선택',
                    style: mblack_text,
                  )),
              const SizedBox(
                height: 10,
              ),
              dateSelect(dayWeith, dayHeight),
              const PlaceTimePicker(text: '예약 시작 시간'),
              const PlaceTimePicker(text: '예약 종료 시간'),
              const PeoplePicker(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomButton(mWeith: mWeith * 0.5, text: '임시저장'),
            BottomButton(mWeith: mWeith * 0.5, text: '등록'),
          ],
        ),
      ),
    );
  }

  Row dateSelect(double dayWeith, double dayHeight) {
    return Row(
      children: [
        Container(
          width: dayWeith,
          height: dayHeight,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isButton1Pressed = !_isButton1Pressed;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  _isButton1Pressed ? kAccentColor : Colors.grey[400],
            ),
            child: const Text('일'),
          ),
        ),
        Container(
          width: dayWeith,
          height: dayHeight,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isButton2Pressed = !_isButton2Pressed;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  _isButton2Pressed ? kAccentColor : Colors.grey[400],
            ),
            child: const Text('월'),
          ),
        ),
        Container(
          width: dayWeith,
          height: dayHeight,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isButton3Pressed = !_isButton3Pressed;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  _isButton3Pressed ? kAccentColor : Colors.grey[400],
            ),
            child: const Text('화'),
          ),
        ),
        Container(
          width: dayWeith,
          height: dayHeight,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isButton4Pressed = !_isButton4Pressed;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  _isButton4Pressed ? kAccentColor : Colors.grey[400],
            ),
            child: const Text('수'),
          ),
        ),
        Container(
          width: dayWeith,
          height: dayHeight,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isButton5Pressed = !_isButton5Pressed;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  _isButton5Pressed ? kAccentColor : Colors.grey[400],
            ),
            child: const Text('목'),
          ),
        ),
        Container(
          width: dayWeith,
          height: dayHeight,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isButton6Pressed = !_isButton6Pressed;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  _isButton6Pressed ? kAccentColor : Colors.grey[400],
            ),
            child: const Text('금'),
          ),
        ),
        Container(
          width: dayWeith,
          height: dayHeight,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isButton7Pressed = !_isButton7Pressed;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  _isButton7Pressed ? kAccentColor : Colors.grey[400],
            ),
            child: const Text('토'),
          ),
        ),
      ],
    );
  }
}
