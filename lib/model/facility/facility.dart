// 다트 enum 한글 안됨

enum Facility { one, two, three, four, five }

final List<Facility> facilities = List.generate(
  Facility.values.length,
  (index) => Facility.values[index],
);

extension FacilityExtension on Facility {
  String get name {
    switch (this) {
      case Facility.one:
        return 'Wifi';
      case Facility.two:
        return '냉장고';
      case Facility.three:
        return '주차장';
      case Facility.four:
        return '화장실';
      case Facility.five:
        return '정수기';
      default:
        return '';
    }
  }
}
