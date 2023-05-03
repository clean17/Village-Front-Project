class Search {
  Search({required this.keyword}) : id = DateTime.now().microsecondsSinceEpoch;

  final int id;
  final String keyword;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    keyword: json["keyword"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "keyword": keyword,
  };
}
