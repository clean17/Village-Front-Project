class PlaceRepository {
  static final PlaceRepository _instance = PlaceRepository._single();
  factory PlaceRepository() {
    return _instance;
  }
  PlaceRepository._single();

  fetchPost(int id, String jwt) {}
}
