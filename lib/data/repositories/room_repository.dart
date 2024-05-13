import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
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
      "/rooms/$roomId",
      options: Options(headers: {"Authorization": accessToken}),
    );

    print("HTTP 연결 상태: ${response.statusCode}");
    print("데이터: ${response.data}");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      // 직접 Map에서 예약 데이터를 파싱합니다.
      Room room = Room.fromJson(responseDTO.body as Map<String, dynamic>);
      responseDTO.body = room; // Update the body to be the single reservation object

      print('데이터 확인 : ${room.toString()}');
    } else {
      print("예약 상세보기 실패");
    }

    return responseDTO;
  }



}

