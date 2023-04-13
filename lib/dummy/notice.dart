import 'package:flutter/material.dart';
import 'package:village/view/pages/common/notice_detail_page.dart';

class Notice {
  String title;
  String subtitle;
  String body;

  Notice(this.title, this.subtitle, this.body);
}

List<Notice> buildNotices(){
  List<Notice> notices = [];
  notices.add(Notice("[공지] VILLAGE 앱이 리뉴얼되었어요", "2023.04.13", "빌리지가 업데이트 이후로 달라졌어요! 새로워진 빌리지 공간을 빌려보세요!"));
  notices.add(Notice("[공지] 제휴 공간 등록 / 요청 안내", "2023.04.03", "빌리지에 제휴된 연습 공간이 1,900개를 돌파했습니다!사용자 여러분들을 위해 더욱 다양한 전국의연습 공간을 제휴 맺고 등록중에 있습니다.내가 사는 지역에 연습실이 더 빨리 확보되어서 예약하고 싶은 분은 카카오톡 플러스친구 '빌리지'를 검색하셔서 상담채팅으로 지역 명을 알려주시면 빠르게 확보하도록 할게요!"));
  notices.add(Notice("[공지] VILLAGE 서비스 일시 중단 안내", "2023.03.27", "더 쾌적한 서비스 제공을 위해 서비스가 일시 중단될 예정입니다. 작업 시간 동안에는 빌리지 서비스 이용이 중단됩니다. 이용에 불편을 드려 죄송합니다."));
  notices.add(Notice("[공지] VILLAGE 창구 프로그램 4기 선정", "2023.03.16", "안녕하세요. 빌리지입니다. 빌리지 모바일 앱서비스가 구글플레이(GooglePlay)과 중소벤처기업부, 창업진흥원이 선정하는 창구 프로그램에 최종 선정되었습니다. 창구 프로그램에 선정되려면 기술, 독창성, 개발역량, 유저 평점과 리뷰 그리고 글로벌 진출 가능성 등의 평가를 거쳐야하는데요! 높은 경쟁률을 뚫고 선정되었습니다 👏👏앞으로도 성장 단계별 크리에이터의 콘텐츠 공간 예약 고민을 해결해주는 앱이자, 글로벌 크리에이터의 고민을 해결하는 대표적인 온오프라인 플랫폼으로 성장하겠습니다.감사합니다."));
  notices.add(Notice("[공지] 실내 마스크 착용 의무 조정에 따른 안내", "2023.01.20", "안녕하세요. 빌리지입니다. 질병관리청에서 설 연휴 이후(23. 1. 30일 부터) 실내 마스크 착용 의무 조정 1단계 시행을 발표하였습니다. 실외에 이어 실내에서도 마스크를 자율적으로 착용하도록 권고로 전환되는데요. *다만, 고위험군 보호 등을 위해 감염취약시설, 의료기관 및 약국, 대중교통수단 내에서는 착용 의무가 유지됩니다."));

  return notices;
}

List<ListTile> showNotices(){
  List<Notice> notices = buildNotices();
  for (int i = 0; i < 5; i++){
    notices.addAll(buildNotices());
  }
  List<ListTile> list = [];
  for(var notice in notices) {
    list.add(ListTile(
      title: Text(notice.title),
      subtitle: Text(notice.subtitle),
      onTap: (){
      },
    ),);
  }
  return list;
}