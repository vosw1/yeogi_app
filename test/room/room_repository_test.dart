import 'package:yogi_project/data/repositories/room_repository.dart';

void main() async {
  await fetchRoomDetail_test();
}

Future<void> fetchRoomDetail_test() async {
  await RoomRepository().fetchRoomDetail(1);
      }