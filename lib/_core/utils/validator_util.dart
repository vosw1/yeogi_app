// 유효성 걸기

// 이메일 - 공백, 형식
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "이메일은 공백이 들어갈 수 없습니다.";
  } else if (!isEmail(value)) {
    return "이메일 형식에 맞지 않습니다.";
  } else {
    return null;
  }
}

bool isEmail(String? value) {
  final RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  return emailRegex.hasMatch(value ?? '');
}

// 패스워드 - 공백, 길이(4~12)
String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return "패스워드 공백이 들어갈 수 없습니다.";
  } else if (value.length > 12) {
    return "패스워드의 길이를 초과하였습니다.";
  } else if (value.length < 4) {
    return "패스워드의 최소 길이는 4자입니다.";
  } else {
    return null;
  }
}

// 제목 - 공백, 100자 미만
String? validateTitle(String? value) {
  if (value!.isEmpty) {
    return "제목은 공백이 들어갈 수 없습니다.";
  } else if (value.length > 100) {
    return "제목의 길이를 초과하였습니다.";
  } else {
    return null;
  }
}

// 내용 - 공백, 1000자 미만
String? validateContent(String? value) {
  if (value!.isEmpty) {
    return "내용은 공백이 들어갈 수 없습니다.";
  } else if (value.length > 1000) {
    return "내용의 길이를 초과하였습니다.";
  } else {
    return null;
  }
}

String? validateName(String? value) {
  if (value!.isEmpty) {
    return "이름은 공백이 들어갈 수 없습니다.";
  } else if (value.length < 2) {
    return "이름은 2자 이상 입력하셔야 합니다.";
  } else {
    return null;
  }
}

String? validateAddress(String? value) {
  if (value!.isEmpty) {
    return "주소는 공백이 들어갈 수 없습니다.";
  } else {
    return null;
  }
}

String? validateAge(String? value) {
  if (value!.isEmpty) {
    return "생년월일은 공백이 들어갈 수 없습니다.";
  } else {
    return null;
  }
}

String? validatePhoneNumber(String? value) {
  if (value!.isEmpty) {
    return "전화번호는 공백이 들어갈 수 없습니다.";
  } else {
    return null;
  }
}


bool _isEmailDuplicate(String? email) {
  // 여기서는 가짜 함수로 구현하였으며, 실제로는 서버 또는 데이터베이스와 통신하여 확인해야 합니다.
  // 이 예시에서는 임의로 'test@email.com'이 중복되었다고 가정합니다.
  return email == 'test@email.com';
}