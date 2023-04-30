// 다트 enum 한글 안됨

enum Facility {
  one,
  two,
  three,
}

final List<Facility> facilities = List.generate(
  Facility.values.length,
  (index) => Facility.values[index],
);

extension FacilityExtension on Facility {
  String get name {
    switch (this) {
      case Facility.one:
        return '화장실';
      case Facility.two:
        return '편의시설 추가';
      case Facility.three:
        return '주차장';
      default:
        return '';
    }
  }
}
