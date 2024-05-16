class JoinReqDTO {
  final String name;
  final String password;
  final String email;
  final String phone;
  final String birth;

  JoinReqDTO({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.birth,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
    "email": email,
    "phone": phone,
    "birth": birth,
  };
}

class LoginReqDTO {
  final String email;
  final String password;

  LoginReqDTO({required this.email, required this.password});

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}

class DuplimentEmailCheckDTO {
  final String email;

  DuplimentEmailCheckDTO({
    required this.email,
  });

  Map<String, dynamic> toJson() => {"email": email};
}