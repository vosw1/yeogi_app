// // 창고 데이터
// import 'package:flutter/material.dart';
//
// class SessionUser {
//   User? user;
//   String? accessToken;
//   bool isLogin = false;
//
//   SessionUser();
// }
//
// // 창고
// class SessionStore extends SessionUser {
//   final mContext = navigatorKey.currentContext;
//
//   Future<void> join(JoinReqDTO joinReqDTO) async {
//     ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
//
//     // 비지니스 로직
//     if (responseDTO.success) {
//       Navigator.pushNamed(mContext!, Move.loginPage);
//     } else {
//       ScaffoldMessenger.of(mContext!).showSnackBar(
//         SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")),
//       );
//     }
//   }
//
//   Future<void> login(LoginReqDTO loginReqDTO) async {
//     var (responseDTO, accessToken) =
//     await UserRepository().fetchLogin(loginReqDTO);
//
//     if (responseDTO.success) {
//       await secureStorage.write(key: "accessToken", value: accessToken);
//
//       this.user = responseDTO.data;
//       this.accessToken = accessToken;
//       this.isLogin = true;
//
//       Navigator.pushNamed(mContext!, Move.postListPage);
//     } else {
//       ScaffoldMessenger.of(mContext!).showSnackBar(
//           SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")));
//     }
//   }
//
//   // 로그아웃
//   Future<void> logout() async {
//     this.user = null;
//     this.accessToken = null; // 수정: jwt 대신 accessToken 사용
//     this.isLogin = false;
//     await secureStorage.delete(key: "accessToken"); // 수정: "jwt" 대신 "accessToken" 삭제
//     Logger().d("세션 종료 및 디바이스 JWT 삭제");
//   }
// }
//
// // 창고 관리자
// final sessionProvider = StateProvider<SessionStore>((ref) {
//   return SessionStore();
// });
