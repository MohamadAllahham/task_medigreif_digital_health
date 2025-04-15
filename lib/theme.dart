import 'package:flutter/material.dart';

const _primaryColor = Color(0xff9dc183);
const _secondaryColor = Color(0xffcfdc7f);
const _errorColor = Color(0xfff44336);
const _white = Color(0xffffffff);
const _darkColor = Color(0xff828282);
const _darkestColor = Color(0xff222222);
const _backgroundColor = Color(0xFFF7F5F2);
// moods colors
const sadMoodColor = Color(0xFFFF9800);
const angryMoodColor = Color(0xFFFFB300);
const okayMoodColor = Color(0xFF64B5F6);
const goodMoodColor = Color(0xff9dc183);
const happyMoodColor = Color(0xFF4CAF50);


final themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: _primaryColor,
  fontFamily: 'Roboto',
  scaffoldBackgroundColor: _backgroundColor,
  colorScheme: ColorScheme.light(
    primary: _primaryColor,
    secondary: _secondaryColor,
    error: _errorColor,
    onPrimary: _white,
    onSecondary: _darkestColor,
    onError: _white,
    surface: _white,
    onSurface: _darkestColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: _white,
    selectedItemColor: _primaryColor,
    unselectedItemColor: _darkColor,
    selectedIconTheme: const IconThemeData(size: 26.0),
    unselectedIconTheme: const IconThemeData(size: 24.0),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16.0, color: _darkColor),
    labelLarge: TextStyle(fontSize: 16.0, color: _darkestColor),
    bodyMedium: TextStyle(fontSize: 14.0),
    titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: _darkestColor),
  ),
);