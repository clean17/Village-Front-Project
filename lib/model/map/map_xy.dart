List<MapXy> mapXyFromJson(dynamic str) =>
    List<MapXy>.from(str.map((x) => MapXy.fromJson(x)));

class MapXy {
  int? id;
  String? title;
  String? x;
  String? y;

  MapXy({
    this.id,
    this.title,
    this.x,
    this.y,
  });

  factory MapXy.fromJson(Map<String, dynamic> json) => MapXy(
        id: json["id"],
        title: json["title"],
        x: json["x"],
        y: json["y"],
      );
}
