import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:yogi_project/_core/constants/size.dart';

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
  late GoogleMapsPlaces _places;

  @override
  void initState() {
    super.initState();
    _controllerCompleter = Completer<GoogleMapController>();
    _getCurrentLocation();
    _places = GoogleMapsPlaces(apiKey: 'YOUR_API_KEY');
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
          if (_currentPosition != null) {
            _addMarker(_currentPosition!, 'current');
            _goToCurrentPosition();
          }
          print('현재 위치를 찾았습니다: $position');
        });
      }
    } catch (e) {
      print('위치 가져오기 오류: $e');
    }
  }

  void _addMarker(LatLng coordinate, String placeId) {
    final int id = Random().nextInt(100);
    final MarkerId markerId = MarkerId(id.toString());
    final Marker marker = Marker(
      markerId: markerId,
      position: coordinate,
      onTap: () {
        if (placeId != 'current') {
          _showPlaceDetails(placeId);
        }
      },
    );
    setState(() {
      markers.add(marker);
    });
  }

  Future<void> _showPlaceDetails(String placeId) async {
    try {
      PlacesDetailsResponse response = await _places.getDetailsByPlaceId(placeId);
      if (response.status == 'OK') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(response.result.name ?? ''),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('주소: ${response.result.formattedAddress ?? ''}'),
                Text('전화번호: ${response.result.formattedPhoneNumber ?? ''}'),
                Text('평점: ${response.result.rating ?? ''}'),
                Text('가격 수준: ${response.result.priceLevel ?? ''}'),
              ],
            ),
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
      } else {
        print('장소 세부 정보를 가져오지 못했습니다: ${response.errorMessage}');
      }
    } catch (e) {
      print('장소 세부 정보 검색 오류: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('내 주변 검색하기'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: gap_m, horizontal: gap_s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: gap_m),
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
            SizedBox(height: gap_s),
            ElevatedButton.icon(
              onPressed: () {
                _goToCurrentPosition();
              },
              icon: Icon(Icons.location_on),
              label: Text('내 위치에서 찾아보기'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GoogleMap(
                  initialCameraPosition: _currentPosition != null
                      ? CameraPosition(target: _currentPosition!, zoom: 12)
                      : CameraPosition(target: LatLng(35.1796, 129.0756), zoom: 12),
                  onMapCreated: (controller) async {
                    _controllerCompleter.complete(controller);
                  },
                  markers: markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onTap: (coordinate) {
                    _searchNearbyPlaces(coordinate);
                  },
                ),
              ),
            ),
            SizedBox(height: gap_s),
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
    }
  }

  Future<void> _searchNearbyPlaces(LatLng coordinate) async {
    try {
      PlacesSearchResponse response = await _places.searchNearbyWithRadius(
        Location(lat: coordinate.latitude, lng: coordinate.longitude),
        20000,
        type: 'lodging',
      );

      if (response.status == 'OK') {
        setState(() {
          searchResults.clear();
          for (PlacesSearchResult result in response.results) {
            _addMarker(
              LatLng(result.geometry!.location.lat, result.geometry!.location.lng),
              result.placeId!,
            );
            searchResults.add(result.name!);
          }
        });
      }
    } catch (e) {
      print('주변 숙소 검색 오류: $e');
    }
  }
}
