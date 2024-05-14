import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _currentPosition = LatLng(35.15958250100625, 129.06019165022786); // 초기 위치를 부산 근처의 좌표로 설정

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print('위치 가져오기 오류: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // SingleChildScrollView 추가
        child: Column(
          children: [
            Container(
              height: 300, // 높이 조절 필요
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  target: _currentPosition,
                  zoom: 14.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            SizedBox(height: 16), // 조절 가능한 간격
            FloatingActionButton.extended(
              onPressed: _goToTheLake,
              label: Text('To the lake!'),
              icon: Icon(Icons.directions_boat),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: _currentPosition,
        zoom: 19.0,
      ),
    ));
  }
}
