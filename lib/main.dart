import 'package:app_ios/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "iPubli",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xff007aff),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    ),
  );
}
