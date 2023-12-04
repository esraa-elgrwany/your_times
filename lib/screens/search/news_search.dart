import 'package:esraa_news_app/layouts/home_cubit/cubit.dart';
import 'package:esraa_news_app/layouts/home_cubit/states.dart';
import 'package:esraa_news_app/screens/news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/repo/data_sources/remote_ds.dart';

class NewsSearch extends StatelessWidget {

  NewsSearch();

  @override
  Widget build(BuildContext context) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(HomeCubit
                .get(context)
                .articlesList[index]);
          },
          itemCount: HomeCubit
              .get(context)
              .articlesList
              .length,

        );
  }
}
