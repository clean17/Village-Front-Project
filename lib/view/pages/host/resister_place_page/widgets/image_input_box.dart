import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:village/core/constants/style.dart';

class ImageInputBox extends StatefulWidget {
  const ImageInputBox({
    super.key,
  });
  @override
  State<ImageInputBox> createState() => _ImageInputBoxState();
}

List<XFile>? images;
List<File>? images2 = [];

class _ImageInputBoxState extends State<ImageInputBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 1),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: images2?.isEmpty == true
              ? const Center(
                  child: Text(
                  '공간 이미지를 추가하세요',
                  style: mlarge_black_text,
                ))
              : Expanded(
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        images2!.length,
                        (index) => // friends 는 유저정보 리스트
                            Stack(
                          children: [
                            Card(
                              child: Image.file(
                                height: 200,
                                images2![index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.6), // 그림자 색상
                                        spreadRadius:
                                            -8, // 그림자 전체 크기를 얼마나 확장시킬 것인지
                                        blurRadius: 8, // 그림자의 흐림 정도를 설정합니다.
                                        offset: const Offset(
                                            0, 0), // 그림자 위치 조정을 위한 오프셋 값
                                        // 오프셋 설정 ?
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    color: Colors.white,
                                    icon: const Icon(
                                      Icons.close,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        images2!.removeAt(index);
                                      });
                                    },
                                  ),
                                ))
                          ],
                        ),
                      )),
                ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: ElevatedButton(
              onPressed: () async {
                var picker = ImagePicker();
                List<XFile> images = await picker.pickMultiImage(
                  maxHeight: 200,
                  maxWidth: 200,
                );
                if (images.isNotEmpty) {
                  setState(() {
                    images2?.addAll(
                        images.map((image) => File(image.path)).toList());
                  });
                }
              },
              child: const Text('이미지 추가')),
        )
      ],
    );
  }
}
