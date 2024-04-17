import 'package:flutter/material.dart';
import 'package:yogi_project/components/data/tab.dart';

class MyPageAppBar extends StatelessWidget {

  const MyPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("마이페이지"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GridView.count(
          crossAxisCount: 4, // ➊
          children: List.generate(
            tabs.length,
                (index) => Column(
              children: [
                Icon(tabs[index].icon),
                const SizedBox(height: 5),
                Text(tabs[index].text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}