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
      alignment: Alignment.bottomCenter,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: backgroundColor,
      ),
      child: FractionallySizedBox(
        heightFactor: percent,
        child: Container(
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            gradient: LinearGradient(
              begin: Alignment(0, percent == 0 ? 0 : -1 / percent),
              end: Alignment.bottomCenter,
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
