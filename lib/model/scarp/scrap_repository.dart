class ScrapRepository {
  static final ScrapRepository _instance = ScrapRepository._single();
  factory ScrapRepository() {
    return _instance;
  }
  ScrapRepository._single();
}
