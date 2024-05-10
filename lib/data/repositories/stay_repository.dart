import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/oversea_stay_list_view_model.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/sale_stay_list_view_model.dart';

class StayRepository {
  // 숙소 검색
  Future<ResponseDTO> fetchStaySearchList() async {
    final response = await dio.get(
      "/stay/search",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      responseDTO.body = stays; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }

  // 특가 숙소 리스트
  Future<ResponseDTO> fetchSaleStayList() async {
    final response = await dio.get(
      "/stays/sale",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    Logger().d(response.data);
    Logger().d(response.runtimeType);
    Logger().d(responseDTO.body);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      SaleStayListModel stayListModel = SaleStayListModel(stays);
      responseDTO.body = stayListModel; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }

  // 해외 숙소 리스트
  Future<ResponseDTO> fetchOverseaStayList() async {
    final response = await dio.get(
      "/stays/oversea",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    Logger().d(response.data);
    Logger().d(response.runtimeType);
    Logger().d(responseDTO.body);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      OverseaStayListModel stayListModel = OverseaStayListModel(stays);
      responseDTO.body = stayListModel; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }

  // 메인 페이지
  Future<ResponseDTO> fetchHomeStayList() async {
    final response = await dio.get(
      "/home",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();


      responseDTO.body = stays; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }
}
