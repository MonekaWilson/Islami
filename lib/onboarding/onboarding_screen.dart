import 'package:flutter/material.dart';
import 'package:islami/app-colors.dart';
import 'package:islami/onboarding/widgets/dot_indicator.dart';
import 'package:islami/onboarding/widgets/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home_screen.dart';
import '../models/on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "onBoardingScreen";

  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingData> onBoardingList = [
    OnBoardingData(
        imagePath: "assets/images/onboarding1.png",
        title: "Welcome To Islmai App"),
    OnBoardingData(
        imagePath: "assets/images/onboarding2.png",
        title: "Welcome To Islmai",
        desc: "We Are Very Excited To Have You In Our Community"),
    OnBoardingData(
        imagePath: "assets/images/onboarding3.png",
        title: "Reading the Quran",
        desc: "Read, and your Lord is the Most Generous"),
    OnBoardingData(
        imagePath: "assets/images/onboarding4.png",
        title: "Bearish",
        desc: "Praise the name of your Lord, the Most High"),
    OnBoardingData(
        imagePath: "assets/images/onboarding5.png",
        title: "Holy Quran Radio",
        desc:
            "You can listen to the Holy Quran Radio through the application for free and easily"),
  ];

  PageController pageController = PageController();

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page?.toInt() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/quran_logo.png"),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) =>
                    OnBoardingPage(onBoardingData: onBoardingList[index]),
                itemCount: onBoardingList.length,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: currentIndex != 0
                              ? () {
                                  pageController.animateToPage(currentIndex - 1,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.fastOutSlowIn);
                                }
                              : null,
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: AppColor.primaryColor,
                              textStyle: TextStyle(
                                fontSize: 16,
                              )),
                          child: Text(
                            currentIndex != 0 ? "Back" : "",
                          )),
                      TextButton(
                          onPressed: () {
                            if (currentIndex == 4) {
                              _onBoardingDone();
                            } else {
                              pageController.animateToPage(currentIndex + 1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.fastOutSlowIn);
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: AppColor.primaryColor,
                              textStyle: TextStyle(
                                fontSize: 16,
                              )),
                          child: Text(
                            currentIndex == 4 ? "Finish" : "Next",
                          )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotIndicator(
                      isActive: currentIndex == 0,
                    ),
                    DotIndicator(
                      isActive: currentIndex == 1,
                    ),
                    DotIndicator(
                      isActive: currentIndex == 2,
                    ),
                    DotIndicator(
                      isActive: currentIndex == 3,
                    ),
                    DotIndicator(
                      isActive: currentIndex == 4,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onBoardingDone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool("firstTime", false);
    //ignore: use_build_context_synchronously
    Navigator.pushNamed(context, HomeScreen.routeName);
  }
}
