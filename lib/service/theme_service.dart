import 'package:flutter/material.dart';

class ThemeService {

  static const SizedBox verticalGap20 = SizedBox(height: 20,);
  static const SizedBox verticalGap10 = SizedBox(height: 10,);
  static const Color colorBlue = Color.fromRGBO(33, 66, 202, 1);
  static const Color colorWhite = Color(0xFFFFFFFF);
  static TextStyle headerStyle = const TextStyle(
      color: ThemeService.colorWhite, fontWeight: FontWeight.bold, fontSize: 20);
  static TextStyle labelStyle = const TextStyle(color: ThemeService.colorWhite, fontSize: 16);
}