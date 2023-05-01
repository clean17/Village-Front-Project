enum Confirm {
  one,
  two,
}

final List<Confirm> facilities = List.generate(
  Confirm.values.length,
  (index) => Confirm.values[index],
);

extension FacilityExtension on Confirm {
  String get name {
    switch (this) {
      case Confirm.one:
        return '승인 필요';
      case Confirm.two:
        return '승인 필요 없음';
    }
  }
}
