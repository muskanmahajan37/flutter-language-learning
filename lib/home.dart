import 'package:flutter/material.dart';

import 'course.dart';
import 'widgets/bottom_bar_button.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.outlined_flag),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Visibility(
            visible: selectedTab == 0,
            child: CourseScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomBarButton(Icons.school, selected: selectedTab == 0),
          BottomBarButton(Icons.forum, selected: selectedTab == 1),
          BottomBarButton(Icons.notifications, selected: selectedTab == 2),
          BottomBarButton(Icons.person, selected: selectedTab == 3),
        ],
      ),
    );
  }
}
