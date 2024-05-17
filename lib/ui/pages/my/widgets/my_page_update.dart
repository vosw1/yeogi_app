import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart'; // shared_preferences 패키지 추가
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/auth/join/widget/join_text_form_field.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/my_page.dart';
import 'dart:io';

class MyPageUpdate extends StatefulWidget {
  final User users;

  MyPageUpdate({required this.users});

  @override
  _MyPageUpdateState createState() => _MyPageUpdateState();
}

class _MyPageUpdateState extends State<MyPageUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = MaskedTextController(mask: '0000-00-00');
  final _phoneController = MaskedTextController(mask: '000-0000-0000');
  File? _imageFile;
  late bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.users.name!;
    isLogin = SessionStore().accessToken != null;
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _showLoginPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그인 필요'),
          content: Text('로그인해주세요.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // 로그인 페이지로 이동하는 로직 추가
                // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Center(child: Text('확인')),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원정보 수정', style: h4()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(gap_m),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: ClipOval(
                      child: _imageFile != null
                          ? Image.file(
                        _imageFile!,

                        width: 150,
                        height: 150,

                        fit: BoxFit.cover,
                      )
                          : Image.asset(
                        "assets/images/user1.png",

                        width: 150,
                        height: 150,

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

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
                  hintText: "비밀번호를 입력하세요",
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
                SizedBox(height: gap_l),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // 회원정보 수정 로직 구현
                      print('이름: ${_nameController.text}');
                      print('비밀번호: ${_passwordController.text}');
                      print('생년월일: ${_ageController.text}');
                      print('전화번호: ${_phoneController.text}');
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPage(
                          users: User(
                            name: _nameController.text,
                            password: _passwordController.text,
                            id: 1,
                            email: '',
                            createdAt: null,
                            updatedAt: null,
                            userImgTitle: '',
                          ),
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(gap_s),
                    child: Text('수정하기', style: h5(mColor: Colors.white)),
                  ),
                ),
                SizedBox(height: gap_m),
              ],
            ),
          ),
        ),
      ),
    );
  }
}