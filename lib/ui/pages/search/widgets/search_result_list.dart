import 'package:flutter/material.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    Key? key,
    required this.searchResults,
  }) : super(key: key);

  final List<String> searchResults;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: searchResults.isEmpty
          ? Center(
        child: Text(
          '검색 결과가 없습니다.',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResults[index]),
          );
        },
      ),
    );
  }
}
