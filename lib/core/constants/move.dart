import 'package:flutter/material.dart';
import 'package:village/view/pages/host/host_resister_place_page.dart';
import 'package:village/view/pages/map/juso_search_page.dart';

class Move {
  // 주소는 임의로 이름붙이는 것
  static String postHomePage = "/post/home";
  static String postWritePage = "/post/write";
  static String joinPage = "/join";
  static String loginPage = "/login";
  static String userDetailPage = "/user/detail";
  static String jusoSearchPage = "/juso";
  static String hostResitserPlacePage = "/host/resister";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    //  /주소이름: (context) => 실제페이지(),

    // Move.joinPage: (context) => JoinPage(),
    // Move.loginPage: (context) => LoginPage(),
    // Move.postHomePage: (context) => PostHomePage(),
    // Move.postWritePage: (context) => PostWritePage(),
    // Move.userDetailPage: (context) => const UserDetailPage(),
    Move.jusoSearchPage: (context) => const JusoSearchPage(title: '주소검색 ? '),
    Move.hostResitserPlacePage: (context) => const HostResisterPlacePage(),
  };
}
