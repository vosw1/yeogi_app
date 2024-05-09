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

    // Get the 'Authorization' header value if it exists
    final accessToken = response.headers.value('Authorization');
    if (accessToken != null) {
      Logger().d("Authorization Token: $accessToken");
      // Store the token in secure storage
      await secureStorage.write(key: "accessToken", value: accessToken);
      Logger().d("Token stored successfully in secure storage.");
    } else {
      Logger().d("Authorization header is missing");
    }

    // DTO 파싱하기
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print('데이터 확인 : ${ResponseDTO.fromJson(response.data)}');
    return responseDTO;
  }

  Future<(ResponseDTO, String)> fetchLogin(LoginReqDTO loginReqDTO) async {
    final response = await dio.post("/users/login", data: loginReqDTO.toJson());
    Logger().d("Response Data: ${response.data}");
    Logger().d("Response Headers: ${response.headers}");

    // Get the 'Authorization' header value if it exists
    final accessToken = response.headers.value('Authorization');
    if (accessToken != null) {
      Logger().d("Authorization Token: $accessToken");
      // Store the token in secure storage
      await secureStorage.write(key: "accessToken", value: accessToken);
      Logger().d("Token stored successfully in secure storage.");
    } else {
      Logger().d("Authorization header is missing");
    }

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.success && accessToken != null) {
      return (responseDTO, accessToken);
    } else {
      return (responseDTO, "");
    }
  }
}