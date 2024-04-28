// 유효성 걸기

// 이메일 - 공백, 형식
Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return "이메일은 공백이 들어갈 수 없습니다.";
   // } else if (!isEmail(value)) {
     // return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

// 패스워드 - 공백, 길이(4~12)
Function validatePassword() {
  return (String? value) {
    if (value!.isEmpty) {
      return "패스워드 공백이 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "패스워드의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4자입니다.";
    } else {
      return null;
    }
  };
}

// 제목 - 공백, 100자 미만
Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      return "제목은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 100) {
      return "제목의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

// 내용 - 공백, 1000자 미만
Function validateContent() {
  return (String? value) {
    if (value!.isEmpty) {
      return "내용은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 1000) {
      return "내용의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}