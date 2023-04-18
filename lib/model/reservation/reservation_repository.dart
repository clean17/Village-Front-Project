class ReservationRepository {
  static final ReservationRepository _instance =
      ReservationRepository._single();
  factory ReservationRepository() {
    return _instance;
  }
  ReservationRepository._single();
}
