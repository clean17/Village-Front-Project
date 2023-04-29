import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/host/resister_place_page/host_resister_place_page_view_model.dart';

class ImageInputBox extends ConsumerWidget {
  ImageInputBox({
    super.key,
  });

  List<File>? files = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HostResisterPlacePageViewModel vm =
        ref.read(hostResisterPlacePageProvider.notifier);
    HostResisterPlacePageModel? pm = ref.read(hostResisterPlacePageProvider);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 1),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          // 이미지 추가 시 화면에 보여줌
          child: pm?.files?.isEmpty == true
              ? const Center(
                  child: Text(
                  '공간 이미지를 추가하세요',
                  style: mlarge_black_text,
                ))
              : Expanded(
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        pm!.files!.length,
                        (index) =>
                            // 이미지 리스트
                            Stack(
                          children: [
                            Card(
                              child: Image.file(
                                height: 200,
                                pm.files![index],
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
                                      files!.removeAt(index);
                                      vm.notifyChangeImages(files!);
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
                List<XFile> xfiles = await picker.pickMultiImage(
                  maxHeight: 200,
                  maxWidth: 200,
                );
                if (xfiles.isNotEmpty) {
                  files?.addAll(
                      xfiles.map((image) => File(image.path)).toList());
                  vm.notifyChangeImages(files!);
                }
              },
              child: const Text('이미지 추가')),
        )
      ],
    );
  }
}
