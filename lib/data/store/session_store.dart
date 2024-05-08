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
  int? selectedPostId;

  SessionUser();
}

// 창고
class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;

  SessionStore();

  void loginCheck(String path) {
    if (isLogin) {
      Navigator.pushNamed(mContext!, path);
    } else {
      Navigator.pushNamed(mContext!, Move.loginPage);
    }
  }

  Future<void> join(JoinReqDTO joinReqDTO) async {
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);

    // 비지니스 로직
    if (responseDTO.success) {
      Navigator.pushNamed(mContext!, Move.mainHolder);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("회원가입 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }

  Future<void> login(LoginReqDTO loginReqDTO) async {
    var (responseDTO, accessToken) =
        await UserRepository().fetchLogin(loginReqDTO);

    if (responseDTO.success) {
      await secureStorage.write(key: "accessToken", value: accessToken);

      this.user = responseDTO.response;
      this.accessToken = accessToken;
      this.isLogin = true;

      // 비지니스 로직
      if (responseDTO.success) {
        Navigator.pushNamedAndRemoveUntil(mContext!, Move.mainHolder, (route) => false);
      } else {
        ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")),
        );
      }
    }
  }
}

// 창고 관리자
final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore();
});
