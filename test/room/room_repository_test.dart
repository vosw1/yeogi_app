import 'package:yogi_project/data/repositories/room_repository.dart';

void main() async {
  await fetchRoomDetail_test();
}

Future<void> fetchRoomDetail_test() async {
  await RoomRepository().fetchRoomDetail(
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ2OTU4MjYsInVzZXJuYW1lIjoic3NhciJ9.HW89ytooDsjNCs1aofKvIrZOYCnJmhW0PkQUAXai0SwcztF3DB62d8DreLBf2RV9z807t-6PoqGA9EaMHYi1Ww", 1);
}