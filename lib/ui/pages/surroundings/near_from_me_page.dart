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
  late GoogleMapController _controller;
  LatLng? _currentPosition;
  Set<Marker> _markers = {};
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.denied) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium,
        );
        setState(() {
          _currentPosition = LatLng(position.latitude, position.longitude);
        });
      } else {
        // Handle case when location permission is denied
      }
    } catch (e) {
      print('Error getting current location: $e');
      // Handle error getting current location
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Places'),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _currentPosition == null
                ? Center(
              child: CircularProgressIndicator(),
            )
                : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition!,
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                _searchNearbyPlaces(_currentPosition!);
              },
              markers: _markers,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search nearby places',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _searchNearbyPlaces(_currentPosition!);
            },
          ),
        ),
      ),
    );
  }

  void _searchNearbyPlaces(LatLng currentPosition) {
    String searchText = _searchController.text;
    // Implement nearby places search logic here using searchText
    // You can use the Geocoding API or any other service to find nearby places
    // and add markers to the map accordingly
    // For demonstration purposes, let's add a random nearby place marker
    _addMarker(LatLng(currentPosition.latitude + 0.001, currentPosition.longitude + 0.001));
  }

  void _addMarker(LatLng coordinate) {
    final int id = Random().nextInt(100);
    final MarkerId markerId = MarkerId(id.toString());

    final Marker marker = Marker(
      markerId: markerId,
      position: coordinate,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Place Info'),
            content: Text('Add your place information here'), // Add your place information here
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );

    setState(() {
      _markers.add(marker);
    });
  }
}