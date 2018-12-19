import 'package:flutter/material.dart';

class Lesson {
  final Image icon;
  final String title;
  final int current;
  final int total;

  const Lesson({this.icon, this.title, this.current, this.total});

  Lesson.fromJson(jsonData)
      : icon = Image.asset("assets/images/${jsonData['icon']}.png"),
        title = jsonData['title'],
        current = jsonData['current'],
        total = jsonData['total'];
}
