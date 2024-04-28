import 'package:flutter/material.dart';
import 'package:yogi_project/ui/pages/auth/login/login_page.dart';

class ScrapPage extends StatefulWidget {
  @override
  State<ScrapPage> createState() => _ScrapPageState();
}

class _ScrapPageState extends State<ScrapPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

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
          Tab(text: "국내숙소"),
          Tab(text: "해외숙소"),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginPage(),
                      ),
                    );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginPage(),
                      ),
                    );
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
