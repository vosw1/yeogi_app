import 'package:yogi_project/data/dtos/book_request.dart';
import 'package:yogi_project/data/repositories/book_repository.dart';

void main() async {
  await fetchBookSaveTest();
  await testFetchBookListTest();
}

Future<void> fetchBookSaveTest() async {
  // given
  BookSaveReqDTO requestDTO = BookSaveReqDTO(
    location: '',
    bookName: '박동기',
    bookTel: '01011111111',
    roomName: '슈페리어 더블',
    roomImgTitle: 'hotel/hotelRoom1.png',
    price: 142000,
    checkInDate: DateTime(2024, 5, 12),
    checkOutDate: DateTime(2024, 5, 14),
  );

  // 초기화된 액세스 토큰
  String accessToken =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2NzAyNjM0LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.FwTkMHoGRu56kdpWdfCYei1MmPHIV6vvz59kTAk_jWaXzo9bQpfpMwZl_iaTUO1dUZF5qXnlqvr4Sq4OMA_GGQ";

  // Send join request
  final response = await BookRepository().fetchBookSave(requestDTO, accessToken);

  // Log response
  print("Join Response: $response");
}

Future<void> testFetchBookListTest() async {
  // 초기화된 액세스 토큰
  String accessToken =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2NzAyNjM0LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.FwTkMHoGRu56kdpWdfCYei1MmPHIV6vvz59kTAk_jWaXzo9bQpfpMwZl_iaTUO1dUZF5qXnlqvr4Sq4OMA_GGQ";

  // Send fetch book list request
  final response = await BookRepository().fetchBookList(accessToken);

  // Log response
  print("Book List Response: $response");
}
