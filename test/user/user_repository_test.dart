import 'package:yogi_project/data/dtos/user_request.dart';
import 'package:yogi_project/data/repositories/user_repository.dart';

void main() async {
    await fetchJoinTest();
}

Future<void> fetchJoinTest() async {
  // given
  JoinReqDTO requestDTO = JoinReqDTO(
    email: "12343@nate.com",
    password: "1234",
    name: "박기동",
    phone: "01012231234",
    birth: "1991-12-12",
  );

  // Send join request
  final response = await UserRepository().fetchJoin(requestDTO);

  // Log response
  print("Join Response: $response");
}
