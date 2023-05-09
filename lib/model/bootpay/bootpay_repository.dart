class BootPayRepository {
  static final BootPayRepository _instance = BootPayRepository._single();
  factory BootPayRepository() {
    return _instance;
  }
  BootPayRepository._single();
}
