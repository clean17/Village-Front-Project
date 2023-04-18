class ReviewRepository {
  static final ReviewRepository _instance = ReviewRepository._single();
  factory ReviewRepository() {
    return _instance;
  }
  ReviewRepository._single();
}
