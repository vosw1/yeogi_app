import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/data/models/Reply.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/auth/join/widget/join_text_form_field.dart'; // JoinTextFormField 임포트 추가
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/my_page.dart'; // User 모델 임포트 추가

class MyPageUpdate extends StatefulWidget {
  final User user; // User 데이터 전달을 위한 필드 추가

  MyPageUpdate({required this.user}); // 생성자 추가

  @override
  _MyPageUpdateState createState() => _MyPageUpdateState();
}

class _MyPageUpdateState extends State<MyPageUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = MaskedTextController(mask: '0000-00-00');
  final _phoneController = MaskedTextController(mask: '000-0000-0000');

  @override
  void initState() {
    super.initState();
    // User 데이터를 사용하여 필드 초기화
    _nameController.text = widget.user.username;
    // 다른 필드들도 위와 같이 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원정보 수정'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(gap_m),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: gap_m),
                JoinTextFormField(
                  controller: _nameController,
                  labelText: '이름',
                  validator: validateName,
                  hintText: "이름을 입력하세요",
                ),
                SizedBox(height: gap_m),
                JoinTextFormField(
                  controller: _passwordController,
                  labelText: '비밀번호',
                  validator: validatePassword,
                  hintText: "패스워드를 입력하세요",
                ),
                SizedBox(height: gap_m),
                JoinTextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  labelText: '생년월일',
                  hintText: 'YYYY-MM-DD',
                  validator: validateAge,
                ),
                SizedBox(height: gap_m),
                JoinTextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  labelText: '전화번호',
                  hintText: '000-0000-0000',
                  validator: validatePhoneNumber,
                ),
                SizedBox(height: gap_m),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // 회원정보 수정 로직 구현
                      print('이름: ${_nameController.text}');
                      print('비밀번호: ${_passwordController.text}');
                      print('생년월일: ${_ageController.text}');
                      print('전화번호: ${_phoneController.text}');

                      // Navigate to MyPage with updated user and stay data
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPage(
                            userData: User(
                              username: _nameController.text,
                              password: _passwordController.text,
                              phone: _phoneController.text,
                              birth: _ageController.text,
                            ),
                            stayData: Stay(
                              stayName: '★당일특가★ 하이원리조트 마운틴콘도',
                              stayImgTitle: 'hotel/hotel1.png',
                              location: '강원 정선군 고한읍 고한리 438',
                              stayInfo: 'dsh',
                              notice: 'ttfdgjn',
                              reviews: [
                                Review(
                                  rating: 4,
                                  comment:
                                  "스노우월드 가기위해서 객실 예약을 했는데 늦은시간 입실했지만 조용하고 24시간 편의점도 꽤 커서 잘 놀다가요! 객실도 따뜻하고 깨끗해서 너무 좋았고 화장실도 두개나 있어서 여유있게 사용했습니다 :) 스노우월드는 너무 너무 강추해요!!! 다음엔 스키타러 또 올게요~",
                                  replies: [
                                    Reply(
                                      text: "이용해주셔서 감사합니다",
                                    ),
                                  ].map((reply) => Review(
                                    rating: 4, // 대댓글에는 별점이 없으므로 기본값으로 설정
                                    comment: reply.text, userName: '', userImgTitle: '',
                                  )).toList(), userName: '', userImgTitle: '',
                                ),
                                Review(
                                  rating: 3,
                                  comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.",
                                  replies: [
                                    Reply(
                                      text: "다음에 방문해주신다면 이런일 없도록 하겠습니다 감사합니다",
                                    ),
                                  ].map((reply) => Review(
                                    rating: 4, // 대댓글에는 별점이 없으므로 기본값으로 설정
                                    comment: reply.text, userName: '', userImgTitle: '',
                                  )).toList(), userName: '', userImgTitle: '',
                                ),
                              ],
                            ), eventTitleBannerData: [],
                          ),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                  ),
                  child: Text(
                    '수정',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: gap_l),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
