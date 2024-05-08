import 'package:dio/dio.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/stay.dart';

class StayRepository{
  Future<ResponseDTO> fetchStayList(String accessToken, {int page = 0}) async {
    final response = await dio.get(
      "/stay",
      options: Options(headers: {"Authorization": "${accessToken}"}),
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      List<dynamic> temp = responseDTO.response["stays"];
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      responseDTO.response = stays; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }
}
