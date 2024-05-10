import 'package:dio/dio.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/room.dart';

class RoomRepository{
  Future<ResponseDTO> fetchRoomList(String accessToken, {int page = 0}) async {
    final response = await dio.get(
      "/stay",
      options: Options(headers: {"Authorization": "${accessToken}"}),
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.response["rooms"];
      List<Room> rooms = temp.map((e) => Room.fromJson(e)).toList();

      responseDTO.response = rooms; // 객실 목록을 responseDTO에 할당
    }

    return responseDTO;
  }
}

