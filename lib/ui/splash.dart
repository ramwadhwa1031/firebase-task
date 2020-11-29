import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:firebaseapp/ui/screen1.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';


class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My App",
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhUCcmuC8tpX2gWSXD8tpC08TOkNk0Wn457w&usqp=CAU"),
          nextScreen: MainScreen1(),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
          backgroundColor: Colors.red.shade800,
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen1();
  }
}