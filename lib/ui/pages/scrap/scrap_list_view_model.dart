import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/scrap.dart';
import 'package:yogi_project/data/repositories/scrap_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/main.dart';

class ScrapListModel {
  List<Scrap> scraps;

  ScrapListModel(this.scraps);
}

class ScrapListViewModel extends StateNotifier<ScrapListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  ScrapListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    print("통신 수행!");
    SessionUser sessionUser = ref.read(sessionProvider);

    // 로그인된 경우에만 스크랩 리스트 가져오기
    ResponseDTO responseDTO =
    await ScrapRepository().fetchScrapList(sessionUser.accessToken!);

    Logger().d(responseDTO);
    Logger().d(responseDTO.body);

    state = responseDTO.body;
  }

  // 스크랩 추가 메서드
  Future<void> notifyAdd(int stayId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    if (sessionUser.accessToken == null) {
      print("로그인이 되지 않았습니다");
    } else {
      ResponseDTO responseDTO =
      await ScrapRepository().fetchScrap(stayId, sessionUser.accessToken!);
      if (responseDTO.status == 200) {
        print("스크랩 등록에 성공 하셨습니다");
        notifyInit();  // 스크랩 추가 후 목록 갱신
      } else {
        print("스크랩 등록에 실패 하셨습니다");
      }
    }
  }

  // 스크랩 삭제 메서드
  Future<void> notifyRemove(int stayId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await ScrapRepository()
        .fetchDeleteScrap(stayId, sessionUser.accessToken!);
    if(sessionUser.accessToken == null){
      print("로그인이 되지 않았습니다");
    } else{
      if (responseDTO.status == 200) {
        print("스크랩 삭제에 성공 하셨습니다");
        notifyInit();  // 스크랩 삭제 후 목록 갱신
      } else {
        print("스크랩 삭제에 실패 하셨습니다");
      }
    }
  }

  void clearScrapList() {
    state = null;
  }
}

// 상태 관리 제공자
final scrapListProvider =
StateNotifierProvider.autoDispose<ScrapListViewModel, ScrapListModel?>(
        (ref) {
      return ScrapListViewModel(null, ref)..notifyInit();
    });
