import 'package:flutter/material.dart';
import 'package:tb_forum/views/splashscreen.dart';

void main() {
  runApp(const MyMainApp());
}

class MyMainApp extends StatelessWidget {
  const MyMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TB Forum',
      home: SplashScreenPage(),
    );
  }
}
