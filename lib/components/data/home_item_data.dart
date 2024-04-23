// 국내 해외 상품 기본 틀
class ItemData {
  final String stayImgTitle;// 숙소 이미지
  final String userImgTitle;// 유저 프로필 이미지
  final double starCount; // 별점
  final String comment; // 리뷰 내용
  final String userName; // 리뷰 작성한 유저네임
  final String location; // 위치

  ItemData({
    required this.stayImgTitle,
    required this.userImgTitle,
    required this.starCount,
    required this.comment,
    required this.userName,
    required this.location,
  });
}