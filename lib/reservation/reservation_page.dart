import 'package:flutter/material.dart';

// 찜 페이지 기본 틀
class ReservationPage extends StatefulWidget {
  @override
  State<ReservationPage> createState() => _ScrapPageState();
}

class _ScrapPageState extends State<ReservationPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(child: _buildTabBarView()),
      ],
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: "예약"),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(
          color: Colors.grey[300],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "찜 목록을 볼 수 없어요",
                  style: TextStyle(fontSize: 20, color: Colors.grey, fontFamily: 'Jalnan2TTF'),
                ),
                SizedBox(height: 8),
                Text(
                    "로그인 후 찜한 상품을 확인 할 수 있어요",
                    style: TextStyle(fontSize: 12, fontFamily: 'Jalnan2TTF', color: Colors.grey)
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Text("로그인", style: TextStyle(color: Colors.white), ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.grey[300],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "찜 목록을 볼 수 없어요",
                  style: TextStyle(fontSize: 20, color: Colors.grey, fontFamily: 'Jalnan2TTF'),
                ),
                SizedBox(height: 8),
                Text(
                  "로그인 후 찜한 상품을 확인 할 수 있어요",
                  style: TextStyle(fontSize: 12, fontFamily: 'Jalnan2TTF', color: Colors.grey),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Text("로그인", style: TextStyle(color: Colors.white), ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
