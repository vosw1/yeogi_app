import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yogi_project/_core/constants/size.dart'; // 위치 서비스를 사용하기 위한 패키지

class NearFromMePage extends StatefulWidget {
  @override
  _NearFromMePageState createState() => _NearFromMePageState();
}

class _NearFromMePageState extends State<NearFromMePage> {
  String _searchText = '';
  List<String> searchResults = [];
  late Completer<GoogleMapController> _controllerCompleter;
  late LatLng _currentPosition; // 현재 위치를 저장할 변수

  final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(35.1796, 129.0756), // 부산을 기본 위치로 설정
    zoom: 12,
  );

  final Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _controllerCompleter = Completer<GoogleMapController>();
    _getCurrentLocation(); // initState에서 현재 위치 가져오기
  }

  // 위치 가져오기
  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  void addMarker(LatLng coordinate) {
    int id = Random().nextInt(100);

    setState(() {
      markers.add(Marker(
        position: coordinate,
        markerId: MarkerId(id.toString()),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: gap_l),
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
            SizedBox(height: gap_xs),
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
            SizedBox(height: gap_xs),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(gap_s),
                child: GoogleMap(
                  initialCameraPosition: _initialPosition,
                  onMapCreated: (controller) async {
                    _controllerCompleter.complete(controller);
                  },
                  onTap: addMarker,
                  markers: markers,
                ),
              ),
            ),
            SizedBox(height: gap_m),
            Text(
              '결과 ${searchResults.length}건',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
    final GoogleMapController controller = await _controllerCompleter.future;
    controller.animateCamera(CameraUpdate.newLatLng(_currentPosition));
  }
}
