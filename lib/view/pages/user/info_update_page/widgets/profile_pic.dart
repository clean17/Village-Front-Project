import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _immage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none, //overflow 해결
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: _immage != null
                ? Image.file(_immage!).image
                : const AssetImage("assets/images/profile.jpg"),
          ),
          Positioned(
            right: -5,
            bottom: 0,
            child: SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey.shade300),
                ),
                onPressed: () {
                  _showModalBottomSheet(context);
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black38,
                  minimumSize: const Size(150, 40)),
              onPressed: () {
                _getImage(ImageSource.camera);
              },
              child: const Text("사진 촬영"),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black54,
                  minimumSize: const Size(150, 40)),
              onPressed: () {
                _getImage(ImageSource.gallery);
              },
              child: const Text("갤러리에서 불러오기"),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }

  Future _getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      _immage = imageTemporary;
    });

    Navigator.pop(context); // _showModalBottomSheet가 선택 된 후 닫힘.
  }
}
