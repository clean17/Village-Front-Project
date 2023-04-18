class LikeRepository {
  static final LikeRepository _instance = LikeRepository._single();
  factory LikeRepository() {
    return _instance;
  }
  LikeRepository._single();
}
