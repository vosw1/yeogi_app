class Review {
  final double rating; // 별점
  final String comment; // 코멘트
  final String userName; // 사용자 이름
  final String userImgTitle; // 사용자 아바타 이미지 URL
  List<Review> replies; // 대댓글 목록

  // 숙소 상세 보기
  final reviewId;
  final userId;
  final stayId;
  final reviewScore;
  final reviewContent;
  final isDelete;
  final reviewParentId; // 대댓글인 경우 부모가 필요해서 추가
  List<Review> reviewChildrenList;

  Review({
    required this.rating,
    required this.comment,
    required this.userName,
    required this.userImgTitle,
    this.replies = const [], // 대댓글 목록 초기화

    // 숙소 상세 보기
    this.reviewId,
    this.userId,
    this.stayId,
    this.reviewScore,
    this.reviewContent,
    this.isDelete,
    this.reviewParentId,
    this.reviewChildrenList = const [],
  });

  // Review 객체를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      "rating": rating ?? "",
      "comment": comment ?? "",
      "userName": userName ?? "",
      "userImgTitle": userImgTitle ?? "",
      "replies": replies.map((reply) => reply.toJson()).toList() ?? "",
      // 대댓글 목록을 JSON으로 변환

      // 숙소 상세 보기
      "reviewId": reviewId ?? "",
      "userId": userId ?? "",
      "stayId": stayId ?? "",
      "reviewScore": reviewScore ?? "",
      "reviewContent": reviewContent ?? "",
      "isDelete": isDelete ?? "",
      "reviewParentId": reviewParentId ?? "",
      "reviewChildrenList": reviewChildrenList.map((reply) => reply.toJson()).toList() ?? "",
    };
  }

  // JSON 데이터를 Review 객체로 변환
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: double.parse(json['rating'] ?? "0"),
      comment: json['comment'] ?? "",
      userName: json['userName'] ?? "",
      userImgTitle: json['userImgTitle'] ?? "",
      replies: (json['replies'] as List<dynamic>?)
          ?.map((replyJson) => Review.fromJson(replyJson))
          .toList() ?? [],

      // 숙소 상세 보기
      reviewId: json['reviewId'] ?? "",
      userId: json['userId'] ?? "",
      stayId: json['stayId'] ?? "",
      reviewScore: json['reviewScore'] ?? "0",
      reviewContent: json['reviewContent'] ?? "",
      isDelete: json['isDelete'] ?? "",
      reviewParentId: json['reviewParentId'] ?? "",
      reviewChildrenList: (json['reviewChildrenList'] as List<dynamic>?)
          ?.map((replyJson) => Review.fromJson(replyJson))
          .toList()?? [],
    );
  }
}
