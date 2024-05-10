import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
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
      List<dynamic> temp = responseDTO.body["rooms"];
      List<Room> rooms = temp.map((e) => Room.fromJson(e)).toList();

      responseDTO.body = rooms; // 객실 목록을 responseDTO에 할당
    }

    return responseDTO;
  }


  Future<ResponseDTO> fetchRoomDetail(String accessToken, int roomId, {int page = 0}) async {
    try {
      final response = await dio.get(
        "/rooms/$roomId",
        options: Options(headers: {"Authorization": accessToken}),
      );
      Logger().d(response.data);

      print(response.data);

      if (response.statusCode == 200) {
        // 성공적으로 데이터를 받은 경우
        // 받은 데이터를 JSON 형식으로 파싱합니다.
        final jsonData = response.data as Map<String, dynamic>;
        // Room 객체로 변환합니다.
        final room = Room.fromJson(jsonData);
        // ResponseDTO 객체를 생성하여 데이터를 담습니다.
        final responseDTO = ResponseDTO(
          status: 200,
          errorMessage: null,
          body: room,
        );
        Logger().d(responseDTO.body);
        Logger().d(responseDTO.runtimeType);
        return responseDTO;
      } else {
        // 데이터를 받지 못한 경우
        return ResponseDTO(
          status: response.statusCode,
          errorMessage: response.statusMessage,
          body: null,
        );
      }
    } catch (e) {
      // 예외가 발생한 경우
      return ResponseDTO(
        status: null,
        errorMessage: e.toString(),
        body: null,
      );
    }
  }
}

