import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/repositories/stay_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/main.dart';

// 창고 데이터
class StayListModel {
  List<Stay> stays;

  StayListModel({required this.stays});
}

// 창고
class StayListViewModel extends StateNotifier<StayListModel?> {
  // 1번 리플래시 컨트롤러 등록
  final refreshCtrl = RefreshController();
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  StayListViewModel(super.state, this.ref);

  // 로드함수 (1, 2)
  Future<void> notifyInit(int page) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    String jwt = sessionStore.accessToken!;

    ResponseDTO responseDTO =
        await StayRepository().fetchStaySearchList();

    if (responseDTO.status == 200) {
      StayListModel nextModel = responseDTO.body;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 보기 실패 : ${responseDTO.errorMessage}")));
    }
    // 2. 이벤트 종료시에 리플래시 종료 (최초 로드, 풀다운)
    refreshCtrl.refreshCompleted();
  }

//   Future<void> notifyAdd(StaySaveReqDTO reqDTO) async {
//     SessionUser sessionUser = ref.read(sessionProvider);
//     ResponseDTO responseDTO =
//         await StayRepository().saveStay(reqDTO, sessionUser.accessToken!);
//
//     if (responseDTO.status == 200) {
//       Stay newPost = responseDTO.response;
//
//       Navigator.pop(mContext!);
//     } else {
//       ScaffoldMessenger.of(mContext!).showSnackBar(
//         SnackBar(content: Text("게시물 작성 실패 : ${responseDTO.errorMessage}")),
//       );
//     }
//   }
//
//   // 통신없이 상태 변경
//   void deletePost(int postId) {
//     StayListModel model = state!;
//     List<Stay> prevPosts = model.stays;
//   }
//
//   Future<void> updatePost(Stay stay) async {
//     // 1. 기존 값 가지고 오기
//     StayListModel model = state!;
//   }
// }
}

// 창고 관리자
final postListProvider =
    StateNotifierProvider<StayListViewModel, StayListModel?>((ref) {
  return StayListViewModel(null, ref)..notifyInit(0);
});
