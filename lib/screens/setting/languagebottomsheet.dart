import 'package:esraa_news_app/layouts/home_cubit/cubit.dart';
import 'package:esraa_news_app/layouts/home_cubit/states.dart';
import 'package:esraa_news_app/layouts/main_cubit/main_cubit.dart';
import 'package:esraa_news_app/layouts/repo/data_sources/remote_ds.dart';
import 'package:esraa_news_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit(RemoteDs()),
  child: BlocConsumer<HomeCubit,HomeStates>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
            MainCubit.get(context).changeLanguage("en");
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.en,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!.copyWith(
                    color:Theme.of(context).colorScheme.surface
                  )

                ),
                Spacer(),
                (MainCubit.get(context).languageCode == "en")
                   ? Icon(Icons.done,
                    size: 25, color:green)
                    : SizedBox.shrink(),
              ],
            ),
          ),
          Divider( color:Theme.of(context).colorScheme.primary,
            thickness: 2,
            indent: 40,
            endIndent: 40,
          ),
          InkWell(
            onTap: () {
             MainCubit.get(context).changeLanguage("ar");
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.ar,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!.copyWith(
                      color:Theme.of(context).colorScheme.surface
                  )

                ),
                Spacer(),
                (MainCubit.get(context).languageCode == "en")
                    ? SizedBox.shrink()
                    : Icon(
                  Icons.done,
                  color:green,
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
),
);
  }
}
