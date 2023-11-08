import 'package:esraa_news_app/layouts/home_cubit/cubit.dart';
import 'package:esraa_news_app/models/SourceResponse.dart';
import 'package:esraa_news_app/screens/chip.dart';
import 'package:esraa_news_app/screens/news_item.dart';
import 'package:esraa_news_app/shared/network/remote/api_manager.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController( length:HomeCubit.get(context).sourcesList.length ,
            child:
        TabBar(
          isScrollable: true,
          onTap: (index) {
           HomeCubit.get(context).changeSource(index);
          },
          indicatorColor: Colors.transparent,
          tabs:
          HomeCubit.get(context).sourcesList.map((source) =>Tab(
            child: ChipItem(source, HomeCubit.get(context).sourcesList.indexOf(source)== HomeCubit.get(context).selectedIndex),
          ) ).toList()
        )),
           Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return NewsItem(HomeCubit.get(context).articlesList[index]);
                },
                  itemCount:HomeCubit.get(context).articlesList.length,
                ),
    )
      ],
    ) ;
  }
}
