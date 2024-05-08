class JoinReqDTO {
  final String name;
  final String password;
  final String email;
  final String phone;
  final String address;
  final String birth;

  JoinReqDTO({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.address,
    required this.birth,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
    "email": email,
    "phone": phone,
    "address": address,
    "birth": birth,
  };
}

class LoginReqDTO {
  final String email;
  final String password;

  LoginReqDTO({
    required this.email,
    required this.password
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password
  };
}