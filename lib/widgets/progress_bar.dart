import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final Color backgroundColor;
  final double width;
  final double height;
  final double percent;
  final bool vertical;

  const ProgressBar({
    @required this.percent,
    this.backgroundColor = const Color(0xFFE4E9F5),
    this.width = double.infinity,
    this.height = double.infinity,
    this.vertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: vertical ? Alignment.bottomCenter : Alignment.centerLeft,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: backgroundColor,
      ),
      child: FractionallySizedBox(
        widthFactor: vertical ? 1 : percent,
        heightFactor: vertical ? percent : 1,
        child: Container(
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            gradient: LinearGradient(
              begin: vertical
                  ? Alignment(0, percent == 0 ? 0 : -1 / percent)
                  : Alignment(percent == 0 ? 0 : 1 / percent, 0),
              end: vertical ? Alignment.bottomCenter : Alignment.centerLeft,
              colors: [
                Color(0xFF9B8DFE),
                Color(0xFF7FBBFB),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
