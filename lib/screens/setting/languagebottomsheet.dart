import 'package:esraa_news_app/layouts/home_cubit/cubit.dart';
import 'package:esraa_news_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
            HomeCubit.get(context).changeLanguage("en");
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.en,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!.copyWith(
                    color:Theme.of(context).colorScheme.onSurface
                  )

                ),
                Spacer(),
                (HomeCubit.get(context).languageCode == "en")
                   ? Icon(Icons.done,
                    size: 25, color:Theme.of(context).colorScheme.onSurface)
                    : SizedBox.shrink(),
              ],
            ),
          ),
          Divider( color:green,
            thickness: 2,
            indent: 40,
            endIndent: 40,
          ),
          InkWell(
            onTap: () {
             HomeCubit.get(context).changeLanguage("ar");
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.ar,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface
                  )

                ),
                Spacer(),
                (HomeCubit.get(context).languageCode == "en")
                    ? SizedBox.shrink()
                    : Icon(
                  Icons.done,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
