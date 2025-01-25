import 'dart:async';

import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash_screen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image(
                image: AssetImage("assets/images/splash/splash_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Spacer(),
                        Image(
                          image: AssetImage("assets/images/splash/left.png"),
                          fit: BoxFit.cover,
                        ),
                        Spacer(),
                        Spacer(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage("assets/images/splash/Mosque.png"),
                          fit: BoxFit.cover,
                        ),
                        Center(
                            child: Image(
                          image: AssetImage("assets/images/splash/logo.png"),
                          fit: BoxFit.cover,
                        )),
                        Image(
                          image:
                              AssetImage("assets/images/splash/branding.png"),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage("assets/images/splash/Glow.png"),
                          fit: BoxFit.cover,
                        ),
                        Spacer(),
                        Image(
                          image: AssetImage("assets/images/splash/right.png"),
                          fit: BoxFit.cover,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
