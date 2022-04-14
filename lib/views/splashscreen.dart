import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inshorts_app/views/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>  HomePage(description: '', image: '', slug: '', title: '',))));
  }

  double screenHeight = 0;
  double screenWeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWeight = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff22004c),
      body: Container(
        height: screenHeight,
        width: screenWeight,
        decoration: BoxDecoration(color: Color(0xfff22004c)),
        child: Image(image: AssetImage("assets/images/inshorts_splash.png")),
      ),
    );
  }
}
