// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/place/place_List.dart';
import 'package:village/model/place/place_repository.dart';
import 'package:village/provider/session_provider.dart';

final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageViewModel, HomePageModel?>((ref) {
  SessionUser sessionUser = ref.read(sessionProvider);
  return HomePageViewModel(null)..notifyInit(sessionUser.jwt);
});

// 창고 데이터
class HomePageModel {
  List<Places> placeList;

  HomePageModel({
    required this.placeList,
  });
}

// 창고
class HomePageViewModel extends StateNotifier<HomePageModel?> {
  HomePageViewModel(super.state);

  void notifyInit(String? jwt) async {
    // 토큰은 추후에
    ResponseDTO responseDTO = await PlaceRepository().fetchMain();
    state = HomePageModel(placeList: responseDTO.data);
  }

  // void notifyRemove(int id){
  //   Place place = state!.place;
  //   if(place.id == id){
  //     state = null;
  //   }
  // }
}
