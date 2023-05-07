import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/controller/search_controller.dart';
import 'package:village/core/constants/size.dart';

class SearchKeywordBar extends ConsumerWidget {
  const SearchKeywordBar({
    required this.text,
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final text;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cp = ref.read(searchControllerProvider);
    return Container(
      margin: const EdgeInsets.only(top: 1, left: 5),
      width: getScreenWidth(context) * 0.74,
      height: 42,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(24)),
      child: TextField(
        controller: _searchController,
        onSubmitted: (String keyword) async {
          if (keyword.isNotEmpty) {
            cp.searchKeyword(keyword);
          }
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: text,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
