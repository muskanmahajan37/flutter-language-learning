import 'package:flutter/material.dart';

import '../models/course.dart';
import '../widgets/progress_bar.dart';

class CourseView extends StatelessWidget {
  static final double progressHeight = 44;

  final Course lesson;

  const CourseView(this.lesson);

  Widget _renderIcon() {
    return CircleAvatar(
      radius: progressHeight / 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: lesson.icon,
      ),
    );
  }

  Widget _renderProgress() {
    return SizedBox(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      leading: _renderIcon(),
      title: Text(lesson.title),
      trailing: _renderProgress(),
    );
  }
}
