import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/stay_info.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';

const String GOOGLE_API_KEY = 'YOUR_GOOGLE_API_KEY';

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

    _places = GoogleMapsPlaces(apiKey: GOOGLE_API_KEY);
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
          _showPopupWithDetails(stayId);
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
          if (stayInfo != null) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(stayInfo.name),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('주소: ${stayInfo.address}'),
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
            print('stayInfo가 null입니다.');
          }
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

  void _showPopupWithDetails(String stayId) {
    final stayInfo = stayInfoMap[stayId];
    if (stayInfo != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(stayInfo.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/hotel/${stayInfo.stayImgTitle}',
                    fit: BoxFit.cover, // Use BoxFit to cover the entire container
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(stayInfo.address),
              SizedBox(height: 8),
              Text(stayInfo.description),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('확인'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StayDetailPage(stayId: int.parse(stayId)),
                  ),
                );
              },
              child: Text('상세 보기'),
            ),
          ],
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
              label: Text('내 위치에서 찾기'),
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
          ],
        ),
      ),
    );
  }

  Future<void> _goToCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      if (!mounted) return;

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });

      final GoogleMapController controller = await _controllerCompleter.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentPosition!,
          zoom: 16,
        ),
      ));
    } catch (e) {
      print('현재 위치를 가져오는 중 오류 발생: $e');
    }
  }

  void _searchNearbyPlaces(LatLng coordinate) async {
    final response = await _places.searchNearbyWithRadius(
      Location(lat: coordinate.latitude, lng: coordinate.longitude),
      500,
    );

    if (response.status == 'OK') {
      setState(() {
        searchResults = response.results.map((result) => result.name).toList();
      });
    } else {
      print('검색 결과를 가져오지 못했습니다: ${response.errorMessage}');
    }
  }
}
