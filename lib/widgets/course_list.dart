import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/course.dart';
import 'course_view.dart';

class CourseList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  List<Course> _courses = [];

  @override
  void initState() {
    super.initState();

    _getCourses();
  }

  void _getCourses() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/files/progress.json");
    List<dynamic> jsonLessons = json.decode(data);
    List<Course> courses =
        jsonLessons.map((jsonLesson) => Course.fromJson(jsonLesson)).toList();

    setState(() {
      _courses = courses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: _courses.length,
        itemBuilder: (BuildContext context, int index) {
          return CourseView(_courses[index]);
        },
      ),
    );
  }
}
