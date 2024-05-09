import 'package:yogi_project/data/dtos/book_request.dart';
import 'package:yogi_project/data/dtos/user_request.dart';
import 'package:yogi_project/data/repositories/book_repository.dart';
import 'package:yogi_project/data/repositories/user_repository.dart';

void main() async {
  await fetchJoinTest();
}

Future<void> fetchJoinTest() async {
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

  // Send join request
  final response = await BookRepository().fetchBookSave(requestDTO, '');

  // Log response
  print("Join Response: $response");
}