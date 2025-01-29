import 'package:flutter/material.dart';
import 'package:islami/app-colors.dart';
import 'package:islami/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/home/tabs/quran/quran_tab.dart';
import 'package:islami/home/tabs/radio/radio_tab.dart';
import 'package:islami/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImage = [
    "assets/images/home_bg.png",
    "assets/images/hadeth_bg.png",
    "assets/images/sebha_bg.png",
    "assets/images/radio_bg.png",
    "assets/images/time_bg.png",
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: double.infinity,
            child: Image.asset(
              backgroundImage[selectedIndex],
              fit: BoxFit.cover,
            )),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xff0E0E0E).withOpacity(0.7),
                const Color(0xff0E0E0E),
              ],
            ),
          ),
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColor.primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: buildSelectedItem(
                      index: 0,
                      imageName: 'quran_icon',
                    ),
                    label: "Quran"),
                BottomNavigationBarItem(
                    icon: buildSelectedItem(
                      index: 1,
                      imageName: 'hadeth_icon',
                    ),
                    label: "Hadeth"),
                BottomNavigationBarItem(
                    icon: buildSelectedItem(
                      index: 2,
                      imageName: 'sebha_icon',
                    ),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    icon: buildSelectedItem(
                      index: 3,
                      imageName: 'radio-icon',
                    ),
                    label: "Radio"),
                BottomNavigationBarItem(
                    icon: buildSelectedItem(
                      index: 4,
                      imageName: 'time-icon',
                    ),
                    label: "Time"),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  Widget buildSelectedItem({required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColor.gray.withOpacity(0.6),
            ),
            child:
                ImageIcon(AssetImage("assets/images/$imageName.png"), size: 20))
        : ImageIcon(AssetImage("assets/images/$imageName.png"), size: 20);
  }
}
