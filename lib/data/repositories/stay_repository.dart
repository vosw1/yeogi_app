import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/option.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/stay_image.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_view_model.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/camping_stay_list_view_model.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/guest_house_stay_list_view_model.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/home_and_villa_stay_list_view_model.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/hotel_stay_list_view_model.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/motel_stay_list_view_model.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/oversea_stay_list_view_model.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/pension_stay_list_view_model.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/sale_stay_list_view_model.dart';

import '../models/review.dart';

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

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      OverseaStayListModel stayListModel = OverseaStayListModel(stays);
      responseDTO.body = stayListModel; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }

  // 호텔 숙소 리스트
  Future<ResponseDTO> fetchHotelStayList() async {
    final response = await dio.get(
      "/stays/hotel",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      HotelStayListModel stayListModel = HotelStayListModel(stays);
      responseDTO.body = stayListModel; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }

  // 펜션 숙소 리스트
  Future<ResponseDTO> fetchPensionStayList() async {
    final response = await dio.get(
      "/stays/pension",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      PensionStayListModel stayListModel = PensionStayListModel(stays);
      responseDTO.body = stayListModel; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }

  // 모텔 숙소 리스트
  Future<ResponseDTO> fetchMotelStayList() async {
    final response = await dio.get(
      "/stays/motel",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      MotelStayListModel stayListModel = MotelStayListModel(stays);
      responseDTO.body = stayListModel; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }

  // 홈&빌라 숙소 리스트
  Future<ResponseDTO> fetchHomeAndVillaStayList() async {
    final response = await dio.get(
      "/stays/home-and-villa",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      HomeAndVillaStayListModel stayListModel =
          HomeAndVillaStayListModel(stays);
      responseDTO.body = stayListModel; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }

  // 캠핑 숙소 리스트
  Future<ResponseDTO> fetchCampingStayList() async {
    final response = await dio.get(
      "/stays/camping",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      CampingStayListModel stayListModel = CampingStayListModel(stays);
      responseDTO.body = stayListModel; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }

  // 게하 숙소 리스트
  Future<ResponseDTO> fetchGuesthouseStayList() async {
    final response = await dio.get(
      "/stays/guesthouse",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body;
      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      GuestHouseStayListModel stayListModel = GuestHouseStayListModel(stays);
      responseDTO.body = stayListModel; // 숙소 목록을 responseDTO에 할당
    }

    return responseDTO;
  }

  // 메인 페이지
  Future<ResponseDTO> fetchHomeStayList(String type) async {
    final response = await dio.get(
      "/home",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    Logger().d(responseDTO.body);

    if (responseDTO.status == 200) {
      List<dynamic> temp;
      if (type == "sale") {
        // 특가
        temp = responseDTO.body["specialprices"];
      } else if (type == "domestic") {
        // 국내
        temp = responseDTO.body["domestics"];
      } else if (type == "oversea") {
        // 해외
        temp = responseDTO.body["overseas"];
      } else {
        temp = responseDTO.body;
      }

      List<Stay> stays = temp.map((e) => Stay.fromJson(e)).toList();

      responseDTO.body = stays;
    }

    return responseDTO;
  }

  // 숙소 상세 보기
  Future<ResponseDTO> fetchStayDetail(int stayId) async {
    final response = await dio.get(
      "/stays/$stayId",
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    Logger().d(responseDTO.body);
    Logger().d(responseDTO.runtimeType);

    if (responseDTO.status == 200) {
      // 숙소 파싱
      final stayContents = responseDTO.body['stayContents'];
      Stay stay = Stay.fromJson(stayContents['stay']);

      // 방 파싱
      List<dynamic> roomTemp = responseDTO.body['roomContents'];
      List<Room> rooms = roomTemp.map((e) => Room.fromJson(e)).toList();

      // 숙소 이미지
      List<dynamic> stayImageTemp = responseDTO.body['stayContents']['stayImageList'];
      List<StayImage> stayImages = stayImageTemp.map((e) => StayImage.fromJson(e)).toList();

      // 숙소 리뷰 리스트
      List<dynamic> reviewTemp = responseDTO.body['stayContents']['reviewList'];
      List<Review> stayReviews = reviewTemp.map((e) => Review.fromJson(e)).toList();

      // 숙소 옵션 리스트
      List<dynamic> optionTemp = responseDTO.body['stayContents']['optionList'];
      List<Option> stayOptions = optionTemp.map((e) => Option.fromJson(e)).toList();

      responseDTO.body = StayDetailModel(
        stay: stay,
        rooms: rooms,
        reviews: stayReviews,
        stayImages: stayImages,
        options: stayOptions,
      );
      Logger().d(responseDTO.body);
    }

    return responseDTO;
  }
}
