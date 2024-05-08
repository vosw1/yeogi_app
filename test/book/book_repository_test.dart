import 'package:yogi_project/data/dtos/book_request.dart';
import 'package:yogi_project/data/repositories/book_repository.dart';

void main() async {
  await testFetchBookSave();
}

Future<void> testFetchBookSave() async {
  // given
  BookSaveReqDTO requestDTO = BookSaveReqDTO(
    roomId: '1', // roomId를 문자열로 설정
    location: '',
    bookName: '박동기',
    bookTel: '01011111111',
    roomName: '슈페리어 더블',
    roomImgTitle: 'hotel/hotelRoom1.png',
    price: 142000,
    checkInDate: DateTime(2024, 5, 12),
    checkOutDate: DateTime(2024, 5, 14),
  );

  // Send book save request
  final responseDTO = await BookRepository().fetchBookSave(requestDTO,
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2NzAwMDg5LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.4XmLG0XYuXArzgxA9KZbLoSLQAW0WAAEJNFRzs7ela2HYTYO_fVPjEOXhLO-9BsTddHnLpedOd_XNcYmJJd50Q");

  // Log response
  print("Book Response: ${responseDTO.response}");
}
