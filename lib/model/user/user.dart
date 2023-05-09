class User {
  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.role});

  int id;
  String name;
  String email;
  String? role;

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      role: json["role"] ?? "USER");
}
