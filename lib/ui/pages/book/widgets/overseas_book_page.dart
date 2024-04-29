import 'package:flutter/material.dart';
import 'package:yogi_project/data/dtos/book_request.dart';

import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';
import '../../../../data/models/stay.dart';
import '../../stay/stay_page.dart';

class OverseasBookPage extends StatelessWidget {
  const OverseasBookPage({super.key, required List<Book> OverseasStayBookList});

  @override
  Widget build(BuildContext context) {
    // 해외 숙소 리스트
    List<Stay> OverseasBookList = [
      Stay(
        stayImgTitle: "overseas/overseas1.png",
        stayName: "두짓타니 괌 리조트",
        stayInfo:
            "본 숙소(두짓타니 괌 리조트)는 괌에 잠시 머물거나 본격 여행을 위해 방문하는 여행객들 사이에서 인기 있는 숙소입니다. 투숙객이 즐거운 시간을 보낼 수 있도록 다양한 시설과 특전을 제공합니다. 24시간 룸서비스, Wi-Fi (무료/전 객실), 24시간 경비 서비스, 일일 청소 서비스, 24시간 프런트 데스크 등 여러 가지를 즐길 수 있습니다. 객실은 최적의 편안함을 제공할 수 있도록 설계되어 있으며, 일부 객실에서 평면 TV, 리넨, 슬리퍼, 타월, 옷장 등을 이용할 수 있습니다. 관광 후 아늑한 객실에서 휴식을 취하거나 온수 욕조, 피트니스센터, 사우나, 실외 수영장, 스파 등을 즐길 수 있습니다. 본 숙소(두짓타니 괌 리조트)를 괌 여행의 근거지로 정해 본격적인 여행을 시작해 보세요.",
        location: "1227 Pale San Vitores Road, Tumon, 투몬 베이, 괌, 괌, 96913",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
        starCount: 4.0,
        comment:
            "가격이 비싼감이 없지않지만 환율과 괌 물가 대비 적당하다는 생각이 들었어요 일단 깨끗한건 말할것도 없고요 부족함이 없었던 숙소였어요",
      ),
      Stay(
        stayImgTitle: "overseas/overseas2.png",
        stayName: "호텔 토리피토 하타카 기온",
        stayInfo: "",
        location: "8-24 Reisenmachi, 하카타, 후쿠오카 / 훗쿠오카, 일본, 812-0039",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
        starCount: 5.0,
        comment:
            "맘에 들어요 일본숙소치고 룸도 넓고  1인 베드도 넓어서 좋아요 트윈베드에 쇼파베드가 있어 3명이 와도 사용할수있어요",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('해외 숙소'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: gap_m),
        child: ListView.builder(
          itemCount: OverseasBookList.length,
          itemBuilder: (context, index) {
            final Stay stay = OverseasBookList[index];
            return Padding(
              padding:
                  const EdgeInsets.only(top: gap_m, left: gap_m, right: gap_m),
              child: Row(
                children: [
                  SizedBox(height: gap_xs),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StayPage(stayData: stay),
                          ),
                        );
                      },
                      child: Container(
                        height: 150, // 사진의 높이
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/${stay.stayImgTitle}"), // 이미지 경로
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // 사진과 텍스트 사이 간격
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity, // 화면 너비에 맞추기 위해 사용
                          child: Text(
                            stay.stayName,
                            style: h5(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 4), // 텍스트 사이 간격
                        Text(
                          stay.location, // 숙소 위치
                          style: TextStyle(), maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4), // 텍스트 사이 간격
                        Text(
                          stay.stayInfo, // 숙소 정보
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
