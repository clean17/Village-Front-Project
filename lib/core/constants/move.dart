import 'package:flutter/material.dart';
import 'package:village/view/pages/chat/room_page/chat_room_page.dart';
import 'package:village/view/pages/common/notice_page/notice_page.dart';
import 'package:village/view/pages/common/splash_page/splash_page.dart';
import 'package:village/view/pages/host/resister_place_page/host_resister_place_page.dart';
import 'package:village/view/pages/main/home_page/widgets/home_body.dart';
import 'package:village/view/pages/main/main_page/main_page.dart';
import 'package:village/view/pages/map/juso_search_page/juso_search_page.dart';
import 'package:village/view/pages/map/nearby_place_page/map_nearby_place_page.dart';
import 'package:village/view/pages/payment/bootpay_page.dart';
import 'package:village/view/pages/place/category_page/place_category_page.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page.dart';
import 'package:village/view/pages/review/read_page/review_read_page.dart';
import 'package:village/view/pages/review/save_page/review_save_page.dart';
import 'package:village/view/pages/search/filter_page/search_filter_page.dart';
import 'package:village/view/pages/search/keyword_page/search_keyword_page.dart';
import 'package:village/view/pages/search/result_page/search_result_page.dart';
import 'package:village/view/pages/user/host_apply_page/user_apply_host_page.dart';
import 'package:village/view/pages/user/info_update_page/user_update_info_page.dart';
import 'package:village/view/pages/user/join_page/join_page.dart';
import 'package:village/view/pages/user/login_page/login_page.dart';
import 'package:village/view/pages/user/my_page/my_page.dart';
import 'package:village/view/pages/user/oauth_page/oauth_page.dart';
import 'package:village/view/pages/user/reservation_page/user_reservation_page.dart';
import 'package:village/view/pages/user/scrap_page/user_scrap_page.dart';
import 'package:village/view/pages/user/tel_authorize_page/user_authorize_tel_page.dart';

class Move {
  // 주소는 임의로 이름붙이는 것

  // 스플래쉬
  static String splashPage = '/splash';
  // 메인
  static String homePage = '/home';
  static String mainPage = '/main';
  // 인증
  static String oAuthPage = '/oAuth';
  static String joinPage = '/join';
  static String loginPage = '/login';
  // 채팅
  static String chatRoomPage = '/chat';
  // 공지사항
  static String noticePage = '/notice';
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
  // 유저
  static String myPage = '/myPage';
  static String userApplyHostPage = '/user/apply/host';
  static String userUpdateInfoPage = '/user/info';
  static String userReservationPage = '/user/reservation';
  static String userScrapPage = '/user/scrap';
  static String userAuthorizePage = '/user/authorize';
  // 결제
  static String bootpayPage = '/bootpay';
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    //  /주소이름: (context) => 실제페이지(),

    // 스플래쉬
    Move.splashPage: (context) => const SplashPage(),
    // 메인
    Move.mainPage: (context) => const MainPage(),
    Move.homePage: (context) => const HomeBody(),
    // 인증
    Move.oAuthPage: (context) => const OAuthPage(),
    Move.joinPage: (context) => const JoinPage(),
    Move.loginPage: (context) => const LoginPage(),
    // 채팅
    Move.chatRoomPage: (context) => ChatRoomPage(),
    // 공지사항
    Move.noticePage: (context) => const NoticePage(),
    // 호스트
    Move.hostResitserPlacePage: (context) => HostResisterPlacePage(),
    // 주소, 맵
    Move.jusoSearchPage: (context) => const JusoSearchPage(),
    Move.mapNearbyPlacePage: (context) => const MapNearbyPlacePage(),
    // 공간
    Move.placeDetailPage: (context) => const PlaceDetailPage(),
    Move.placeCategoryPage: (context) => const PlaceCategoryPage(),
    // 리뷰
    Move.reviewSavePage: (context) => const ReviewSavePage(),
    Move.reviewReadPage: (context) => const ReviewReadPage(),
    // 검색
    Move.searchKeywordPage: (context) => SearchKeywordPage(),
    Move.seartchResultPage: (context) => SearchResultPage(),
    Move.searchFilterPage: (context) => const SearchFilterPage(),
    // 유저
    Move.myPage: (context) => const MyPage(),
    Move.userApplyHostPage: (context) => UserApplyHostPage(),
    Move.userUpdateInfoPage: (context) => UserUpdateInfoPage(),
    Move.userReservationPage: (context) => const UserReservationPage(),
    Move.userScrapPage: (context) => const UserScarpPage(),
    Move.userAuthorizePage: (context) => UserAuthorizeTelPage(),
    // 결제
    Move.bootpayPage: (context) => const BootpayPage(),
  };
}
