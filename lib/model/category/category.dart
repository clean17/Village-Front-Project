enum Category {
  one,
  two,
  three,
}

final List<Category> facilities = List.generate(
  Category.values.length,
  (index) => Category.values[index],
);

extension FacilityExtension on Category {
  String get name {
    switch (this) {
      case Category.one:
        return '연습실';
      case Category.two:
        return '공유 오피스';
      case Category.three:
        return '사무실';
      default:
        return '';
    }
  }
}
