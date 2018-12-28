import 'package:flutter/material.dart' hide Drawer;

import 'course.dart';
import 'questions.dart';
import 'widgets/bottom_bar_button.dart';
import 'widgets/drawer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget>[
          Visibility(
            visible: selectedTab == 0,
            child: CourseScreen(),
          ),
          Visibility(
            visible: selectedTab == 1,
            child: QuestionScreen(),
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
