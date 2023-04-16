import 'package:flutter/material.dart';
import 'package:village/core/color.dart';
import 'package:village/core/style.dart';
import 'package:village/view/widgets/bottom_button.dart';
import 'package:village/view/widgets/host/common_form_field.dart';
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
  String? _selectedItem = 'Item 1';
  final RangeValues _selectedRange = const RangeValues(0, 50);

  Duration _selectedTime = const Duration(hours: 0, minutes: 0);

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
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: const Text('AB'),
                ),
                label: const Text('Aaron Burr'),
              ),
              const CommonFormField(hintText: '공간명을 입력하세요', prefixText: '제목'),
              const CommonFormField(hintText: 'api 버튼 만들 예정', prefixText: '주소'),
              const CommonFormField(
                  hintText: '전화번호를 입력하세요  ', prefixText: '전화번호'),
              const CommonFormField(
                  hintText: '시간당 가격을 입력하세요', prefixText: '시간당  가격'),
              const CommonFormField(
                  hintText: '드롭다운으로 만들어볼까', prefixText: '수용인원'),
              const CommonFormField(
                  hintText: '소개 내용을 입력하세요', prefixText: '장소 소개'),
              const CommonFormField(
                  hintText: '유의 사항을 입력하세요', prefixText: '유의 사항'),
              const CommonFormField(
                  hintText: '선택지를 만들어서 클릭할수 있게', prefixText: '편의 시설'),
              const CommonFormField(
                  hintText: '#해시태그를 입력하고 , 로 구분하세요', prefixText: '해시태그'),
              const CommonFormField(
                  hintText: '이미지를 받을수 있게 권한설정 필요', prefixText: '이미지'),
              Slider(
                value: _selectedTime.inMinutes.toDouble(),
                min: 0,
                max: 23 * 60 + 30,
                divisions: 48,
                label:
                    '${_selectedTime.inHours.toString().padLeft(2, '0')}:${(_selectedTime.inMinutes % 60).toString().padLeft(2, '0')}',
                onChanged: (double value) {
                  setState(() {
                    _selectedTime = Duration(minutes: value.toInt());
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${_selectedTime.inHours.toString().padLeft(2, '0')}:'),
                  Text((_selectedTime.inMinutes % 60)
                      .toString()
                      .padLeft(2, '0')),
                ],
              ),
              DropdownButton<String>(
                value: _selectedItem,
                items: const [
                  DropdownMenuItem(
                    value: 'Item 1',
                    child: Text('Item 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Item 2',
                    child: Text('Item 2'),
                  ),
                  DropdownMenuItem(
                    value: 'Item 3',
                    child: Text('Item 3'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                },
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '요일선택',
                    style: mblack_text,
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
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
              )
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
}
