import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/united_pharmacy/login/login_tab.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late AnimationController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (0)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'assets/animations/united_pharmacy_splash_animation.json',
        controller: _controller,
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(() =>
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginTab()),)
            Navigator.pushReplacementNamed(context,'/LoginTab')
            );
        },
      ),
    );
  }
}
