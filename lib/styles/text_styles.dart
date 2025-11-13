import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle h1() {
    return const TextStyle(
      fontSize: 24,
      fontFamily: 'Gilory',
      //fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle h2() {
    return const TextStyle(fontSize: 18);
  }

  static TextStyle h3() {
    return const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontFamily: 'Gilory',
    );
  }

  static TextStyle h4() {
    return const TextStyle(fontSize: 12);
  }
}
