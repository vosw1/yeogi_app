import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/stay_info.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';


const String GOOGLE_API_KEY = 'AIzaSyD64Qv2AkiSWrGiN1sn-cHn-_QuW0XlwjA';

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
  late BitmapDescriptor customIcon;
  Map<String, StayInfo> stayInfoMap = {};

  @override
  void initState() {
    super.initState();
    _controllerCompleter = Completer<GoogleMapController>();

    _places = GoogleMapsPlaces(apiKey: 'AIzaSyD64Qv2AkiSWrGiN1sn-cHn-_QuW0XlwjA');
    _loadCustomMarker().then((value) {
      _getCurrentLocation();
    });
    for (var stayInfo in hotels) {
      stayInfoMap[stayInfo.id.toString()] = stayInfo;
    }
  }


  Future<void> _loadCustomMarker() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(24, 24)),
        'assets/images/hotel_icon.png'
    );
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.denied) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium,
        );

        if (!mounted) return;

        setState(() {
          _currentPosition = LatLng(position.latitude, position.longitude);
          if (_currentPosition != null) {
            _addMarker(_currentPosition!, '현재위치');
            _goToCurrentPosition();
          }
          print('현재 위치를 찾았습니다: $position');
        });

        // 호텔 위치에 마커 추가
        for (var stayInfo in hotels) {
          _addMarker(
            LatLng(stayInfo.latitude, stayInfo.longitude),
            stayInfo.id.toString(),
          );
        }
      } else {
        print('위치 권한이 거부되었습니다.');
      }
    } catch (e) {
      print('위치 가져오기 오류: $e');
    }
  }

  void _addMarker(LatLng coordinate, String stayId) {
    final int id = Random().nextInt(100);
    final MarkerId markerId = MarkerId(id.toString());
    final Marker marker = Marker(
      markerId: markerId,
      position: coordinate,
      icon: customIcon,
      visible: true,
      onTap: () {
        _showPlaceDetails(stayId);
        if (stayId != 'current') {
          _showSnackbarWithDetails(stayId);
        }

      },
    );
    setState(() {
      markers.add(marker);
    });
  }

  Future<void> _showPlaceDetails(String stayId) async {
    try {
      PlacesDetailsResponse response = await _places.getDetailsByPlaceId(stayId);

      print("response.status: ${response.status}");
      if (response.status == 'OK') {
        final result = response.result;
        if (result != null) {
          final stayInfo = stayInfoMap[stayId];
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(stayInfo?.name ?? '이름 없음'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('주소: ${stayInfo?.address ?? '주소 없음'}'),
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
          print('응답에 유효한 결과가 없습니다.');
        }

      } else {
        print('장소 세부 정보를 가져오지 못했습니다: ${response.errorMessage}');
      }
    } catch (e) {
      print('장소 세부 정보 검색 오류: $e');
    }
  }




  void _showSnackbarWithDetails(String stayId) {
    final stayInfo = stayInfoMap[stayId];
    if (stayInfo != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${stayInfo.name} - ${stayInfo.address}'),
          action: SnackBarAction(
            label: '상세 보기',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StayDetailPage(stayId: int.parse(stayId)),
                ),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주변 숙소 검색하기'),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: gap_m, left: gap_m, bottom: gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    if (_currentPosition != null) {
                      _searchNearbyPlaces(_currentPosition!);
                    } else {
                      print('현재 위치를 가져올 수 없습니다.');
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                _goToCurrentPosition();
              },
              icon: Icon(Icons.location_on),
              label: Text('내 위치에서 '),
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
                      ? CameraPosition(target: _currentPosition!, zoom: 16)
                      : CameraPosition(target: LatLng(35.1796, 129.0756), zoom: 16),
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
            SizedBox(height: 16),
            // Uncomment the following lines to display search results
            // Text('결과 ${searchResults.length}건', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // Divider(),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: searchResults.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(searchResults[index]),
            //       );
            //     },
            //   ),
            // ),
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
        print('지도 위치를 현재 위치로 이동했습니다: $_currentPosition');
      }
    } catch (e) {
      print('위치 가져오기 오류: $e');
    }
  }

  Future<void> _searchNearbyPlaces(LatLng coordinate) async {
    try {
      print('주변 숙소 검색 시작 - 좌표: $coordinate');
      PlacesSearchResponse response = await _places.searchNearbyWithRadius(
        Location(lat: coordinate.latitude, lng: coordinate.longitude),
        5000,
        type: 'lodging',
        language: 'korean',
      );

      if (response.status == 'OK') {
        setState(() {
          searchResults.clear();
          markers.clear();

          _addMarker(_currentPosition!, 'current');
          for (PlacesSearchResult result in response.results) {
            _addMarker(
              LatLng(result.geometry!.location.lat, result.geometry!.location.lng),
              result.placeId!,
            );
            searchResults.add(result.name!);
          }
        });
        print('검색된 결과 수: ${response.results.length}');
      } else {
        print('검색 결과 오류: ${response.errorMessage}');
      }
    } catch (e) {
      print('주변 숙소 검색 오류: $e');
    }
  }
}
