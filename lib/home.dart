import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_language_learning/widgets/progress_bar.dart';

import 'models/Lesson.dart';
import 'widgets/bottom_bar_button.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final double progressHeight = 44;

  int selectedTab = 0;
  List<Lesson> _lessons = <Lesson>[];

  @override
  void initState() {
    super.initState();

    getLessons();
  }

  Future<void> getLessons() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/files/progress.json");
    List<dynamic> jsonLessons = json.decode(data);
    List<Lesson> lessons =
        jsonLessons.map((jsonLesson) => Lesson.fromJson(jsonLesson)).toList();

    setState(() {
      _lessons = lessons;
    });
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 8),
      child: Row(
        children: <Widget>[
          Text(
            "French",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 8),
          Text(
            "Level 1",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildList() {
    return Flexible(
      child: ListView.builder(
        itemCount: _lessons.length,
        itemBuilder: (BuildContext context, int index) {
          Lesson lesson = _lessons[index];

          return ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            leading: CircleAvatar(
              radius: progressHeight / 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: lesson.icon,
              ),
            ),
            title: Text(lesson.title),
            trailing: SizedBox(
              height: progressHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("${lesson.current}/${lesson.total}"),
                  SizedBox(width: 12),
                  ProgressBar(
                    percent: lesson.current / lesson.total,
                    width: 4,
                    height: progressHeight,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.outlined_flag),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildHeader(),
          _buildList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
