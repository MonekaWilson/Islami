import 'package:flutter/material.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/home/tabs/hadeth/hadeth_details_srceen.dart';
import 'package:islami/home/tabs/quran/sura_details_screen.dart';
import 'package:islami/splash/splash_screen.dart';
import 'package:islami/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var isFirstTime = await _checkFirstTime();
  runApp(MyApp(firstTime: isFirstTime));
}

Future<bool> _checkFirstTime() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var firstTime = preferences.getBool("firstTime") ?? true;
  return firstTime;
}

class MyApp extends StatelessWidget {
  final bool firstTime;

  const MyApp({required this.firstTime, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          firstTime ? OnBoardingScreen.routeName : HomeScreen.routeName,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
      },
    );
  }
}
