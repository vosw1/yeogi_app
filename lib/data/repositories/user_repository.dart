import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/dtos/user_request.dart';
import 'package:yogi_project/data/models/user.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    // 통신 시작
    final response = await dio.post("/users/join", data: requestDTO.toJson());
    Logger().d(response.data!);

    print('데이터 확인 : ${requestDTO.toJson()}');
    // DTO 파싱하기
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print('데이터 확인 : ${ResponseDTO.fromJson(response.data)}');
    return responseDTO;
  }

  Future<(ResponseDTO, String)> fetchLogin(LoginReqDTO loginReqDTO) async {
    final response = await dio.post("/users/login", data: loginReqDTO.toJson());
    Logger().d(response.data!);
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print('데이터 확인 : ${loginReqDTO.toJson()}');
    if (responseDTO.status == 200) {
      // response가 User 객체인지 확인 후 변환
      if (responseDTO.body is Map<String, dynamic>) {
        responseDTO.body = User.fromJson(responseDTO.body);
        print('데이터 확인 : ${responseDTO.body}');
      }
      final accessToken = response.headers["Authorization"]!.first;
      return (responseDTO, accessToken);
    } else {
      return (responseDTO, "");
    }
  }
}