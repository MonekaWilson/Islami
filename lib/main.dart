import 'package:flutter/material.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/home/tabs/quran/sura_details_screen.dart';
import 'package:islami/splash/splash_screen.dart';
import 'package:islami/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
      },
    );
  }
}
