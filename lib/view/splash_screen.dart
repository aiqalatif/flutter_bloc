import 'package:flutter/material.dart';
import 'package:kineticqr/controller/utiles/constant.dart';

import 'package:kineticqr/view/weight/bottam_navigation_br.dart';
import 'package:lottie/lottie.dart';  // Import lottie package
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

   
    Timer(const Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => BottomNavScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/Animationf.json', 
                width: 350,
                height: 300,
                fit: BoxFit.fill,
              ),
            const  SizedBox(height: 20), 
            const  Text(
                'KintcQr',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: onSurfaceTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
