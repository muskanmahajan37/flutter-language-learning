import 'package:flutter/cupertino.dart';

class BottomBarButton extends BottomNavigationBarItem {
  static const color = Color(0xFF959FBA);
  static const selectedColor = Color(0xFF2E374D);

  BottomBarButton(IconData icon, {bool selected = false})
      : super(
          icon: Icon(icon, color: selected ? selectedColor : color),
          title: Container(),
        );
}
