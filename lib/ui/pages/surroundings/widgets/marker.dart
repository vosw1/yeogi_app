import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerWidget extends StatefulWidget {
  MarkerWidget({required Key key, required this.title, required this.position, required this.markerId}) : super(key: key);

  final String title;
  final LatLng position;
  final MarkerId markerId;

  @override
  _MarkerWidgetState createState() => _MarkerWidgetState();
}

class _MarkerWidgetState extends State<MarkerWidget> {
  late GoogleMapController _controller;

  final CameraPosition _initialPosition =
  CameraPosition(target: LatLng(41.017901, 28.847953));

  final Set<Marker> markers = {}; // markers 리스트 초기화

  addMarker(cordinate) {
    int id = Random().nextInt(100);

    setState(() {
      markers.add(Marker(
        position: cordinate,
        markerId: MarkerId(id.toString()),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        markers: markers,

        onTap: (cordinate) {
          _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker(cordinate);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ),
    );
  }
}
