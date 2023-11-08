import 'package:esraa_news_app/layouts/home_cubit/cubit.dart';
import 'package:esraa_news_app/layouts/home_layout.dart';
import 'package:esraa_news_app/observer.dart';
import 'package:esraa_news_app/screens/news_details.dart';
import 'package:esraa_news_app/screens/setting/setting_tab.dart';
import 'package:esraa_news_app/shared/styles/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // localizationsDelegates: AppLocalizations.localizationsDelegates,
      //supportedLocales: AppLocalizations.supportedLocales,
      //locale: Locale(HomeCubit.get(context).languageCode),
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName:(context) => HomeLayout(),
        //SettingTab.routeName:(context) => SettingTab(),
       NewsDetails.routeName:(context) => NewsDetails(),
      },
      //themeMode:HomeCubit.get(context).modeApp ,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}

