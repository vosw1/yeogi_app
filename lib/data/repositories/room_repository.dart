import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/room_option.dart';
import 'package:yogi_project/data/models/room.dart';

class RoomRepository {
  Future<ResponseDTO> fetchRoomList(String accessToken, {int page = 0}) async {
    final response = await dio.get(
      "/stay",
      options: Options(headers: {"Authorization": "${accessToken}"}),
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body["rooms"];
      List<Room> rooms = temp.map((e) => Room.fromJson(e)).toList();

      responseDTO.body = rooms; // 객실 목록을 responseDTO에 할당
    }

    return responseDTO;
  }


  Future<ResponseDTO> fetchRoomDetail(String accessToken, int roomId,
      {int page = 0}) async {
    final response = await dio.get(
      "/room/detail/$roomId",
      options: Options(headers: {"Authorization": accessToken}),
    );

    print("HTTP 연결 상태: ${response.statusCode}");
    Logger().d(response.data);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      // 직접 Map에서 예약 데이터를 파싱합니다.
      RoomOption roomOption = RoomOption.fromJson(responseDTO.body);
      responseDTO.body = roomOption;
    } else {
      print("룸 상세보기 실패");
    }
    Logger().d(responseDTO.body);
    return responseDTO;
  }
}

