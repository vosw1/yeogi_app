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

  // 로그 아웃 시 사용
  void clearScrapList() {
    state = null;
  }
}

final scrapListProvider =
    StateNotifierProvider.autoDispose<ScrapListViewModel, ScrapListModel?>(
        (ref) {
  return ScrapListViewModel(null, ref)..notifyInit();
});
