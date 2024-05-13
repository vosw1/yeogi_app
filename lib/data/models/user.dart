class User {
  final int? id;
  final String? name;
  final String email;
  final String password;
  final String userImgTitle;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.userImgTitle,
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
      'userImgTitle': userImgTitle,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  // Converts the User object to a string representation
  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, userImgTitle:$userImgTitle, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  // Converts the response data to a User object
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? null,
        name = json["name"] ?? null,
        email = json["email"] ?? "",
        password = json["password"] ?? "",
        userImgTitle = json["userImgTitle"] ?? "user1.png",
        createdAt = json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
        updatedAt = json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null;
}
