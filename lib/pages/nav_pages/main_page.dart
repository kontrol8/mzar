import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzar/pages/home_page.dart';
import 'package:mzar/pages/nav_pages/bar_item_page.dart';
import 'package:mzar/pages/nav_pages/my_page.dart';
import 'package:mzar/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              label: (""),
              icon: SvgPicture.asset(
                "assets/svg/main.svg",
                color: Colors.black,
                height: 15,
                width: 15,
              )),
          BottomNavigationBarItem(
              label: (""),
              icon: SvgPicture.asset(
                "assets/svg/stats.svg",
                color: Colors.black,
                height: 15,
                width: 15,
              )),
          BottomNavigationBarItem(
              label: (""),
              icon: SvgPicture.asset(
                "assets/svg/search.svg",
                height: 15,
                width: 15,
              )),
          BottomNavigationBarItem(label: (""), icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
