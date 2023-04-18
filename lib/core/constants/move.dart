import 'package:flutter/material.dart';

class Move {
  static String postHomePage = "/post/home";
  static String postWritePage = "/post/write";
  static String joinPage = "/join";
  static String loginPage = "/login";
  static String userDetailPage = "/user/detail";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // Move.joinPage: (context) => JoinPage(),
    // Move.loginPage: (context) => LoginPage(),
    // Move.postHomePage: (context) => PostHomePage(),
    // Move.postWritePage: (context) => PostWritePage(),
    // Move.userDetailPage: (context) => const UserDetailPage(),
  };
}
