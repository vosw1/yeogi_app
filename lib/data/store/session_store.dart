// 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/dtos/user_request.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/data/repositories/user_repository.dart';
import 'package:yogi_project/main.dart';

class SessionUser {
  User? user;
  String? accessToken;
  bool isLogin = false;
  bool isJoin = false;
  int? selectedPostId;

  SessionUser();
}

// 창고
class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;

  SessionStore();

  // 로그아웃
  Future<void> logout() async {
    super.user = null;
    super.accessToken = null;
    super.isLogin = false;

    await secureStorage.delete(key: "accessToken");
    navigatorKey.currentState?.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  void loginCheck(String path) {
    if (isLogin) {
      Navigator.pushNamed(mContext!, path);
    } else {
      Navigator.pushNamed(mContext!, Move.loginPage);
    }
  }

  void joinCheck(String path) {
    if (isJoin) {
      Navigator.pushNamed(mContext!, path);
    } else {
      Navigator.pushNamed(mContext!, Move.joinPage);
    }
  }

  Future<void> join(JoinReqDTO joinReqDTO) async {
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);

    // 비지니스 로직
    if (responseDTO.status == 200) {
      // 회원가입 성공
      this.user = User.fromJson(responseDTO.body); // 회원 정보 저장
      this.isJoin = true;
      Navigator.pushNamed(mContext!, Move.mainHolder);
    } else {
      // 회원가입 실패
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("회원가입 실패: ${responseDTO.errorMessage}")),
      );
    }
  }

  Future<void> login(LoginReqDTO loginReqDTO) async {
    var (responseDTO, accessToken) =
        await UserRepository().fetchLogin(loginReqDTO);

    if (responseDTO.status == 200) {
      await secureStorage.write(key: "accessToken", value: accessToken);

      this.user = responseDTO.body;
      this.accessToken = accessToken;
      this.isLogin = true;

      Navigator.pushNamedAndRemoveUntil(mContext!, Move.mainHolder, (route) => false);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")),
      );
    }

  }
}

// 창고 관리자
final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore();
});
