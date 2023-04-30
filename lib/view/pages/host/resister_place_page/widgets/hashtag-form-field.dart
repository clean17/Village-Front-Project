import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/view/pages/host/resister_place_page/host_resister_place_page_view_model.dart';
import 'package:village/view/pages/search/keyword_page/widgets/user_search_keyword.dart';

class HashtagFormField extends ConsumerWidget {
  HashtagFormField({
    super.key,
    required this.prefixText,
    required this.hintText,
    required this.vm,
    this.hashtag,
  });

  final prefixText;
  final hintText;
  final TextEditingController _textController = TextEditingController();
  HostResisterPlacePageViewModel vm;
  List<HashtagReqDTO>? hashtag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Stack(
            children: [
              TextFormField(
                  controller: _textController,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 30, left: 20, bottom: 10),
                    hintText: hintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  onFieldSubmitted: (String input) {
                    HashtagReqDTO hashtagDTO =
                        HashtagReqDTO(hashtagName: input);
                    // 빈 리스트에 새로운 해시태그 추가
                    hashtag!.add(hashtagDTO);
                    // 해시태그 업데이트
                    vm.notifyChangeHashtag(hashtag!);
                    _textController.clear();
                  }),
              Positioned(
                top: 8,
                left: 20,
                child: Text(
                  prefixText,
                  style: const TextStyle(fontSize: 10), // ???
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 0,
                runSpacing: 0,
                children: hashtag!.map((keyword) {
                  return UserSearchKeyword(
                    // 해시태그 리스트
                    text: keyword.hashtagName,
                    onDelete: () {
                      // 프로바이더에서 삭제
                      hashtag!.removeWhere(
                          (e) => e.hashtagName == keyword.hashtagName);
                      vm.notifyChangeHashtag(hashtag!);
                    },
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
