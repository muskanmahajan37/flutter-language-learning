import 'package:flutter/material.dart';

class Course {
  final Image icon;
  final String title;
  final int current;
  final int total;

  const Course({this.icon, this.title, this.current, this.total});

  Course.fromJson(jsonData)
      : icon = Image.asset("assets/images/${jsonData['icon']}.png"),
        title = jsonData['title'],
        current = jsonData['current'],
        total = jsonData['total'];
}
