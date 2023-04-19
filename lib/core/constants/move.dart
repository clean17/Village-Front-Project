import 'package:flutter/material.dart';
import 'package:village/view/pages/chat/chat_room_page/chat_room_page.dart';
import 'package:village/view/pages/host/host_resister_place_page/host_resister_place_page.dart';
import 'package:village/view/pages/map/juso_search_page/juso_search_page.dart';
import 'package:village/view/pages/map/map_nearby_place_page/map_nearby_place_page.dart';
import 'package:village/view/pages/place/place_category_page/place_category_page.dart';
import 'package:village/view/pages/place/place_detail_page/place_detail_page.dart';
import 'package:village/view/pages/review/review_read_page/review_read_page.dart';
import 'package:village/view/pages/review/review_save_page/review_save_page.dart';
import 'package:village/view/pages/search/search_filter_page/search_filter_page.dart';
import 'package:village/view/pages/search/search_keyword_page/search_keyword_page.dart';
import 'package:village/view/pages/search/search_result_page/search_result_page.dart';

class Move {
  // 주소는 임의로 이름붙이는 것

  // 채팅
  static String chatRoomPage = '/chat';
  // 호스트
  static String hostResitserPlacePage = "/host/resister";
  // 주소,맵
  static String jusoSearchPage = "/juso";
  static String mapNearbyPlacePage = '/nearby';
  // 공간
  static String placeDetailPage = '/place/detail';
  static String placeCategoryPage = '/place/category';
  // 리뷰
  static String reviewSavePage = '/review/save';
  static String reviewReadPage = '/review/read';
  // 검색
  static String searchFilterPage = "/search/filter";
  static String searchKeywordPage = '/search/keyword';
  static String seartchResultPage = '/search/result';
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    //  /주소이름: (context) => 실제페이지(),

    Move.chatRoomPage: (context) => ChatRoomPage(),
    Move.hostResitserPlacePage: (context) => const HostResisterPlacePage(),
    Move.jusoSearchPage: (context) => const JusoSearchPage(title: '주소검색 ? '),
    Move.mapNearbyPlacePage: (context) => const MapNearbyPlacePage(),
    Move.placeDetailPage: (context) => const PlaceDetailPage(),
    Move.placeCategoryPage: (context) => const PlaceCategoryPage(),
    Move.reviewSavePage: (context) => const ReviewSavePage(),
    Move.reviewReadPage: (context) => const ReviewReadPage(),
    Move.searchKeywordPage: (context) => const SearchKeywordPage(),
    Move.seartchResultPage: (context) => const SearchResultPage(),
    Move.searchFilterPage: (context) => const SearchFilterPage(),
  };
}
