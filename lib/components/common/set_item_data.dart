class ItemData {
  final String imagePath;
  final double starCount; // 별점을 나타내는 변수 추가
  final String comment;
  final String userName;
  final String location;
  final String imgTitle;

  ItemData({
    required this.imagePath,
    required this.starCount,
    required this.comment,
    required this.userName,
    required this.location,
    required this.imgTitle,
  });
}