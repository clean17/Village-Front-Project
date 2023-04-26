import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: const Color.fromARGB(255, 253, 139, 139),
    textColor: Colors.white,
    fontSize: .0,
  );
}



// void showOverlay(BuildContext context, String message) {
//   OverlayEntry overlayEntry = OverlayEntry(
//     builder: (BuildContext context) => Positioned(
//       left: 100,
//       top: 100,
//       child: ,
//     ),
//   );

//   Overlay.of(context).insert(overlayEntry);
// }

