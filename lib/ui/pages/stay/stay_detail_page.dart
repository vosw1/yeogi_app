import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yogi_project/_core/constants/scroll_fab.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_view_model.dart';
import 'package:yogi_project/ui/pages/stay/widgets/amenities_widget.dart';
import 'package:yogi_project/ui/pages/stay/widgets/review_section.dart';
import 'package:yogi_project/ui/pages/stay/widgets/room_info_widget.dart';
import 'package:yogi_project/ui/pages/stay/widgets/scrap_login_widget.dart';

class StayDetailPage extends ConsumerStatefulWidget {
  final int stayId;

  StayDetailPage({required this.stayId});

  @override
  _StayDetailPageState createState() => _StayDetailPageState();
}

class _StayDetailPageState extends ConsumerState<StayDetailPage> {
  late Completer<GoogleMapController> _controllerCompleter;
  late ScrollController _scrollController;
  LatLng? _currentPosition;
  final Set<Marker> markers = {};
  Color? _scrapColor = Colors.black; // 스크랩 버튼 색상 초기화

  @override
  void initState() {
    super.initState();
    _controllerCompleter = Completer();
    _scrollController = ScrollController();

    // 모델에서 데이터 가져와서 마커 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final model = ref.watch(stayDetailProvider(widget.stayId).notifier).state;
      if (model != null) {
        _currentPosition = LatLng(model.stay.latitude ?? 0.0, model.stay.longitude ?? 0.0);
        markers.add(
          Marker(
            markerId: MarkerId('stay_location'),
            position: _currentPosition!,
            infoWindow: InfoWindow(
              title: model.stay.address,
              snippet: model.stay.address,
            ),
          ),
        );
        // 스크랩 상태에 따른 버튼 색상 설정
        setState(() {
          _scrapColor = model.isScrap ? Colors.redAccent : Colors.black;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(stayDetailProvider(widget.stayId));
    print(widget.stayId);

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '${model.stay.stayName}',
            style: h4(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.bookmark,
                  color: model.isScrap ? Colors.redAccent : Colors.black, // 스크랩 상태에 따라 색상 설정
                ),
                onPressed: () async {
                  if (model.isLogin) {
                    if (!model.isScrap) {
                      await ref.read(stayDetailProvider(widget.stayId).notifier).notifyAdd(widget.stayId);
                    } else {
                      await ref.read(stayDetailProvider(widget.stayId).notifier).notifyRemove(widget.stayId);
                    }
                    // 스크랩 상태가 변경된 후 버튼 색상 업데이트
                    setState(() {
                      _scrapColor = model.isScrap ? Colors.redAccent : Colors.black;
                    });
                  } else {
                    showLoginAlert(context);
                  }
                }
            ),
            SizedBox(width: gap_s),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: gap_m, right: gap_m, bottom: gap_m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(gap_s),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(gap_s),
                    child: Image.asset(
                      'assets${model.stayImages[0].stayImagePath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: gap_m),
                ReviewSection(reviews: model.reviews),
                SizedBox(height: gap_xx),
                AmenitySection(),
                SizedBox(height: gap_xx),
                Text(
                  '객실 선택',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: gap_s),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.rooms?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        if (index != 0) SizedBox(height: gap_s),
                        RoomInfoWidget(
                          rooms: model.rooms![index],
                          roomId: model.rooms![index].roomId,
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: gap_s),
                Divider(),
                SizedBox(height: gap_s),
                Text(
                  '숙소 소개',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: gap_s),
                Text(
                  model.stay.intro,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: gap_s),
                Divider(),
                SizedBox(height: gap_s),
                Text(
                  '숙소 위치',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: gap_s),
                SizedBox(
                  width: double.infinity,
                  height: 220,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GoogleMap(
                      initialCameraPosition: _currentPosition != null
                          ? CameraPosition(target: _currentPosition!, zoom: 16)
                          : CameraPosition(target: LatLng(model.stay.latitude ?? 0.0, model.stay.longitude ?? 0.0), zoom: 12),
                      onMapCreated: (controller) async {
                        _controllerCompleter.complete(controller);
                      },
                      markers: {
                        if (_currentPosition != null) // 현재 위치가 유효한 경우에만 마커를 추가합니다.
                          Marker(
                            markerId: MarkerId('stay_location'),
                            position: _currentPosition!,
                            infoWindow: InfoWindow(
                              title: model.stay.stayName,
                              snippet: model.stay.address,
                            ),
                          ),
                      },
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                    ),
                  ),
                ),
                SizedBox(height: gap_m),
                Text(
                  model.stay.address,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Divider(),
                SizedBox(height: gap_s),
                Text(
                  '이용 정보',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: gap_s),
                Text(
                  model.stay.information,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: gap_s),
                Divider(),
                SizedBox(height: gap_s),
                Text(
                  '취소 및 환불 정책',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: gap_s),
                Text(
                  '객실별 취소 정책이 상이하니 객실 상세정보에서 확인해주세요',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: gap_s),
              ],
            ),
          ),
        ),
        floatingActionButton: ScrollFAB(controller: _scrollController),
      );
    }
  }
}

