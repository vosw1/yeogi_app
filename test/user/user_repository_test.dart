import 'package:yogi_project/data/dtos/user_request.dart';
import 'package:yogi_project/data/repositories/user_repository.dart';

void main() async {
    await fetchLoginTest();
}

Future<void> fetchLoginTest() async {
  // given
  LoginReqDTO requestDTO = LoginReqDTO(
    email: "ssar@nate.com",
    password: "1234",
  );

  // Send join request
  final response = await UserRepository().fetchLogin(requestDTO);

  // Log response
  print("Login Response: $response");
}
