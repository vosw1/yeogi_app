import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class NearFromMePage extends StatefulWidget {
  @override
  _NearFromMePageState createState() => _NearFromMePageState();
}

class _NearFromMePageState extends State<NearFromMePage> {
  String _searchText = '';
  List<String> searchResults = [];
  late Completer<GoogleMapController> _controllerCompleter;
  LatLng? _currentPosition;
  final Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _controllerCompleter = Completer<GoogleMapController>();
    _getCurrentLocation(); // 앱이 시작할 때 현재 위치 가져오기
  }

  // 위치 가져오기
  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.denied) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium,
        );
        setState(() {
          _currentPosition = LatLng(position.latitude, position.longitude);
          if (_currentPosition != null) {
            addMarker(_currentPosition!); // 현재 위치에 마커 추가
            _goToCurrentPosition(); // 현재 위치로 지도 이동
          }
        });
      } else {
        // 위치 권한이 거부된 경우
        // 여기에 사용자에게 권한을 다시 요청하는 로직을 추가할 수 있습니다.
      }
    } catch (e) {
      print('위치 가져오기 오류: $e');
      // 위치 가져오기에 실패한 경우에 대한 처리 추가
    }
  }

  void addMarker(LatLng coordinate) {
    final int id = Random().nextInt(100); // 랜덤한 ID 생성
    final MarkerId markerId = MarkerId(id.toString()); // 마커 ID 생성

    final Marker marker = Marker(
      markerId: markerId,
      position: coordinate,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('마커 정보'),
            content: Text('위도: ${coordinate.latitude}, 경도: ${coordinate.longitude}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('닫기'),
              ),
            ],
          ),
        );
      },
    );

    setState(() {
      markers.add(marker); // 마커 추가
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: '주변 숙소를 찾아보세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      searchResults = [];
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: () {
                _goToCurrentPosition(); // 내 위치로 이동하는 함수 호출
              },
              icon: Icon(Icons.location_on),
              label: Text('내 위치에서 찾아보기'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GoogleMap(
                  initialCameraPosition: _currentPosition != null
                      ? CameraPosition(target: _currentPosition!, zoom: 12)
                      : CameraPosition(target: LatLng(35.1796, 129.0756), zoom: 12), // 부산을 기본 위치로 설정
                  onMapCreated: (controller) async {
                    _controllerCompleter.complete(controller);
                  },
                  markers: markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onTap: (coordinate) {
                    _addMarker(coordinate); // 새로운 마커 추가
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('결과 ${searchResults.length}건'),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 현재 위치로 지도 이동하는 함수
  Future<void> _goToCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );
      if (position != null) {
        setState(() {
          _currentPosition = LatLng(position.latitude, position.longitude);
        });
        final GoogleMapController controller = await _controllerCompleter.future;
        controller.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
      }
    } catch (e) {
      print('위치 가져오기 오류: $e');
      // 위치 가져오기에 실패한 경우에 대한 처리 추가
    }
  }

  // 마커 추가 함수
  void _addMarker(LatLng coordinate) {
    addMarker(coordinate);
  }
}
