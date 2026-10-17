import 'package:animate_do/animate_do.dart';
import 'package:evently/core/theme/App_color.dart';
import 'package:evently/modules/layouts/screens/layout_screens.dart';
import 'package:evently/modules/start/screens/Start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SpalshScreen extends StatelessWidget {
  static const String routeName = "SpalshScreen";
  const SpalshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ZoomIn(
                duration: Duration(seconds: 2),
                child: Hero(
                  tag: "logo",
                  child: Center(
                    child: Image.asset(
                      "assets/logos/eventlyLogo.png",
                      width: 309,
                    ),
                  ),
                ),
              ),
            ),
            FadeInUp(
              delay: Duration(seconds: 2),
              onFinish: (direction) {
               bool  isLogin = FirebaseAuth.instance.currentUser != null ;
               if(isLogin){
                 Navigator.pushReplacementNamed(context, LayoutScreens.routeName);
               }else {
                 Navigator.pushNamed(context, StartScreen.routeName);
               }
              },
              child: Center(
                child: Image.asset("assets/logos/routeLogo.png", width: 214),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
