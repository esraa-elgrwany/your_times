import 'package:esraa_news_app/layouts/home_cubit/cubit.dart';
import 'package:esraa_news_app/layouts/home_cubit/states.dart';
import 'package:esraa_news_app/layouts/repo/data_sources/remote_ds.dart';
import 'package:esraa_news_app/screens/setting/languagebottomsheet.dart';
import 'package:esraa_news_app/screens/setting/themingbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../layouts/main_cubit/main_cubit.dart';
import '../../shared/styles/colors.dart';

class SettingTab extends StatefulWidget{
  static const String routeName="setting";

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
  create: (context) => MainCubit(),
  child: BlocConsumer<MainCubit,MainState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
     appBar: AppBar(
        centerTitle: true,
        backgroundColor: green,
        titleTextStyle:
        GoogleFonts.exo(color: Colors.white, fontSize: 22.sp),
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r))),
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Card(
          shape:OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: green),
          //gapPadding: 12
          ),
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.lang,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.surface
                      )
                          ),
                 Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: Theme.of(context).colorScheme.primary,
                            width: 2.w
                          )),
                      child: Row(
                        children: [
                          Text(MainCubit.get(context).languageCode=="en"?
                          AppLocalizations.of(context)!.en
                              :AppLocalizations.of(context)!.ar,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Theme.of(context).colorScheme.surface)),
                             Spacer(),
                             InkWell(
                               onTap: showLangugeBottomSheet,
                                 child: Icon(Icons.arrow_drop_down,size: 30,color:Theme.of(context).colorScheme.surface ,)),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(AppLocalizations.of(context)!.theme,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.surface
      )),
                  Container(
                      padding: EdgeInsets.all(10).w,
                      margin: EdgeInsets.all(10).w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color:Theme.of(context).colorScheme.primary,
                          width: 2)),
                      child: Row(
                        children: [
                          Text(MainCubit.get(context).modeApp==ThemeMode.light?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,
                              style:
                              Theme.of(context).textTheme.bodyMedium!.
                              copyWith(color:Theme.of(context).colorScheme.surface)),
                          Spacer(),
                          InkWell(
                              onTap: showThemingBottomSheet,
                              child: Icon(Icons.arrow_drop_down,size: 30,color: Theme.of(context).colorScheme.surface,)),
                        ],
                      ),
                    ),
                ],
              ),
          ),
        ),
      ),
    );
  },
),
);
  }

  showLangugeBottomSheet() {
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.transparent)),
      builder: (context) => LanguageBottomSheet(),
    );
  }

  showThemingBottomSheet() {
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.transparent)),
      builder: (context) => ThemingBottomSheet(),
    );
  }
}

