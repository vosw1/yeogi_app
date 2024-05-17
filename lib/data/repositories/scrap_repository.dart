import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/scrap.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/scrap/scrap_list_view_model.dart';

class ScrapRepository {
  // 스크랩 리스트
  Future<ResponseDTO> fetchSrapList() async {
    final response = await dio.get(
      "/api/scrap",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Scrap> scraps =
          temp.map((e) => Stay.fromJson(e)).cast<Scrap>().toList();

      ScrapListModel scrapListModel = ScrapListModel(scraps);
      responseDTO.body = scrapListModel; // 찜 목록을 responseDTO에 할당
    }

    return responseDTO;
  }

  // 스크랩 등록
  Future<ResponseDTO> fetchScrap(int stayId, String accessToken) async {
    final response = await dio.post(
      "/api/scrap/stay/$stayId",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    Logger().d(responseDTO);
    Logger().d(responseDTO.body);

    //responseDTO.body =

    // if (responseDTO.status == 200) {
    //   responseDTO.body = Scrap.fromJson(responseDTO.body);
    //   Logger().d(responseDTO.body.runtimeType);
    // }

    return responseDTO;
  }

  // 스크랩 삭제
  Future<ResponseDTO> fetchDeleteScrap(int stayId, String accessToken) async {
    final response = await dio.delete(
      "/api/scrap/stay/$stayId",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    Logger().d(responseDTO);
    Logger().d(responseDTO.body);

    // if (responseDTO.status == 200) {
    //   responseDTO.body = Scrap.fromJson(responseDTO.body);
    //   Logger().d(responseDTO.body.runtimeType);
    // }

    return responseDTO;
  }
}
