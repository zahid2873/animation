import 'package:animation/pages/flare_animation/flare_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: FlareHomePage(),
    );
  }
}

