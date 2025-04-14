import 'package:app_ios/home_page.dart';
import 'package:flutter/material.dart';

void main() {  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "iPubli",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xff007aff),
          foregroundColor: Colors.white,
        ),
        expansionTileTheme: const ExpansionTileThemeData(
          backgroundColor: Colors.black12,
          collapsedBackgroundColor: Colors.black12,
          textColor: Colors.black,
          collapsedTextColor: Colors.black,
          iconColor: Colors.black,
          collapsedIconColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          tilePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        ),
      ),
      home: const HomePage(),
    ),
  );
}
