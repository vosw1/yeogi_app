import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class NearFromMePage extends StatefulWidget {
  @override
  _NearFromMePageState createState() => _NearFromMePageState();
}

class _NearFromMePageState extends State<NearFromMePage> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // 현재 위치 가져오기
  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주변 정보 검색'),
      ),
      body: Center(
        child: _currentPosition != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '현재 위치:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '위도: ${_currentPosition!.latitude}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '경도: ${_currentPosition!.longitude}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 여기에 주변 정보 검색 및 결과 표시 기능 추가
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NearbyResultsPage(
                      latitude: _currentPosition!.latitude,
                      longitude: _currentPosition!.longitude,
                    ),
                  ),
                );
              },
              child: Text('주변 정보 검색'),
            ),
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}

class NearbyResultsPage extends StatelessWidget {
  final double latitude;
  final double longitude;

  const NearbyResultsPage({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 여기에 주변 정보 검색 및 결과 표시 기능 추가
    // 검색 결과를 표시하는 UI를 구현하여 반환합니다.
    return Scaffold(
      appBar: AppBar(
        title: Text('주변 정보'),
      ),
      body: Center(
        child: Text(
          '현재 위치: 위도 $latitude, 경도 $longitude\n'
              '주변 정보를 여기에 표시합니다.',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NearFromMePage(),
  ));
}
