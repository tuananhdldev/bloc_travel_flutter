import 'package:bloc_travel_app/pages/home_page.dart';
import 'package:bloc_travel_app/pages/navpages/my_page.dart';
import 'package:bloc_travel_app/pages/navpages/search_page.dart';
import 'package:flutter/material.dart';

import 'bar_item_page.dart';
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
    MyPage()
  ];
  int currentIndex = 0;

  void onTap(int index)
  {
     setState(() {
       currentIndex = index;
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        elevation: 0,
       items: [
         BottomNavigationBarItem( icon: Icon(Icons.apps), label: "Home"),
         BottomNavigationBarItem( icon: Icon(Icons.bar_chart), label: "Bar"),
         BottomNavigationBarItem( icon: Icon(Icons.search), label: "Search"),
         BottomNavigationBarItem( icon: Icon(Icons.person), label: "My"),
       ],
      ),
    );
  }
}
