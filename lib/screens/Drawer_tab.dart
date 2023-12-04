import 'package:esraa_news_app/screens/setting/setting_tab.dart';
import 'package:esraa_news_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;

  DrawerTab(this.onClick);

  static int cat_id = 1;
  static int set_id = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * .6,
        color:Theme.of(context).colorScheme.onSecondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: green,
              width: double.infinity,
              height: 100.h,
              child: Center(
                  child: Text(
                AppLocalizations.of(context)!.appTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      onClick(cat_id);
                    },
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              onClick(cat_id);
                            },
                            icon: Icon(
                              Icons.list,
                              size: 25.sp,
                              color:green,
                            )),
                        Text(AppLocalizations.of(context)!.category,
                            style: Theme.of(context).textTheme.bodyMedium
                                !.copyWith(
                              color:Theme.of(context).colorScheme.surface
                            )),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onClick(set_id);
                      Navigator.pushNamed(context,SettingTab.routeName);
                    },
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              onClick(set_id);
                              Navigator.pushNamed(context,SettingTab.routeName);
                            },
                            icon: Icon(
                              Icons.settings,
                              size: 25.sp,
                              color:green,
                            )),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(AppLocalizations.of(context)!.setting,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color:Theme.of(context).colorScheme.surface
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
