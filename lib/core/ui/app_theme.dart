import 'package:flutter/material.dart';

class AppTheme {
  static const textBold = TextStyle(fontWeight: FontWeight.bold);
  static final ThemeData theme = ThemeData(
    primaryColor: const Color(0xFF007d21),
    primaryColorDark: const Color(0xFF00343F),
    fontFamily: 'mplus',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF007d21),
        textStyle: const TextStyle(fontFamily: 'mplus'),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      selectedLabelStyle: textBold,
      unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
      unselectedItemColor: Colors.grey[400],
    ),
  );
}
