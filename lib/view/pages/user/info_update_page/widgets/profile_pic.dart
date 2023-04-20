import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none, //overflow 해결
        fit: StackFit.expand,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.jpg"),
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
                onPressed: () {},
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
}
