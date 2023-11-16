import 'package:esraa_news_app/layouts/home_cubit/cubit.dart';
import 'package:esraa_news_app/layouts/home_cubit/states.dart';
import 'package:esraa_news_app/layouts/repo/data_sources/remote_ds.dart';
import 'package:esraa_news_app/models/category-model.dart';
import 'package:esraa_news_app/screens/TabWidget.dart';
import 'package:esraa_news_app/shared/network/remote/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsTab extends StatelessWidget {
  CategoryModel cat;
 String? search;

  NewsTab(this.cat,{this.search});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(RemoteDs())..getSources(cat.id),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState|| state is HomeGetNewsLoadingState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }else if(state is HomeGetSourcesSuccessState || state is HomeChangeSource){
            HomeCubit.get(context).getNews(search: search);
          }
          else if(state is HomeGetNewsSuccessState){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
    if (state is HomeGetSourcesLoadingState) {
      return Center(child: CircularProgressIndicator());
    }
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabWidget(
              ));
        },
      ),
    );
  }
}
