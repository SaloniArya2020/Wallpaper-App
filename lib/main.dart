import 'package:flutter/material.dart';
import 'package:wallpaper_hub/Screens/home.dart';
import 'package:wallpaper_hub/Screens/img_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper Hub',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:Home()
    );
  }
}