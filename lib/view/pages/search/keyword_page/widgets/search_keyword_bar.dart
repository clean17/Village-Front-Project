import 'package:flutter/material.dart';
import 'package:village/core/constants/size.dart';

class SearchKeywordBar extends StatelessWidget {
  const SearchKeywordBar({
    required this.text,
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;
  final text;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 1, left: 5),
      width: getScreenWidth(context) * 0.74,
      height: 42,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(24)),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: text,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
