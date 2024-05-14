import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyZoom extends StatefulWidget {
  @override
  _MyZoomState createState() => _MyZoomState();
}

class _MyZoomState extends State<MyZoom> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _currentPosition = CameraPosition(
    target: LatLng(35.1658, 129.1573), //사용자 지정 좌표
    zoom: 12, //확대
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: GoogleMap(
          initialCameraPosition: _currentPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete();
          },
        ),
      ),
    );
  }
}