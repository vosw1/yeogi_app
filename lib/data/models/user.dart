class User {
  final int? id;
  final String? name;
  final String email;
  final String password;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  // Converts the User object to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  // Converts the User object to a string representation
  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  // Converts the response data to a User object
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? null,
        name = json["name"] ?? null,
        email = json["email"] ?? "",
        password = json["password"] ?? "",
        createdAt = json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
        updatedAt = json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null;
}
