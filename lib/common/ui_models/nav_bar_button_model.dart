import 'package:flutter/cupertino.dart';

class NavBarButtonModel {
  final Widget content;
  final String title;
  final IconData icon;

  const NavBarButtonModel(
      {required this.content, required this.title, required this.icon});


  BottomNavigationBarItem toBottomNavItem() {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: title,
    );
  }
}
