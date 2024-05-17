import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    // 통신하기
    ResponseDTO responseDTO = await ScrapRepository().fetchSrapList();
    // 상태값 갱신 (새로 new해서 넣어줘야 한다)
    // 여기는 리스트로 받아서 이렇게 설정
    state = responseDTO.body;
  }
}

final scrapListProvider =
StateNotifierProvider<ScrapListViewModel, ScrapListModel?>((ref) {
  return ScrapListViewModel(null, ref)..notifyInit();
});
