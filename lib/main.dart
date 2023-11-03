import 'package:esraa_news_app/layouts/home_layout.dart';
import 'package:esraa_news_app/screens/SettingScreen.dart';
import 'package:esraa_news_app/screens/news_details.dart';
import 'package:esraa_news_app/shared/styles/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName:(context) => HomeLayout(),
        SettingScreen.routeName:(context) => SettingScreen(),
       NewsDetails.routeName:(context) => NewsDetails(),
      },
        theme: MyThemeData.lightTheme,
    );
  }
}

