import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInputBox extends StatefulWidget {
  const ImageInputBox({
    super.key,
  });
  @override
  State<ImageInputBox> createState() => _ImageInputBoxState();
}

class _ImageInputBoxState extends State<ImageInputBox> {
  // File? userImage;
  List<XFile>? images;
  List<File>? images2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black38),
              borderRadius: BorderRadius.circular(10)),
          child: images2 == null
              ? const Text('Add image')
              : Expanded(
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        images2!.length,
                        (index) => // friends 는 유저정보 리스트
                            Image.file(images2![index]),
                      )),
                ),
        ),
        ElevatedButton(
            onPressed: () async {
              var picker = ImagePicker();
              List<XFile> images = await picker.pickMultiImage(
                maxHeight: 100,
                maxWidth: 100,
              );
              if (images.isNotEmpty) {
                setState(() {
                  images2 = images.map((image) => File(image.path)).toList();
                });
              }
            },
            child: const Text('이미지 추가'))
      ],
    );
  }
}
