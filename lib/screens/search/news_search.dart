import 'package:esraa_news_app/layouts/home_cubit/cubit.dart';
import 'package:esraa_news_app/layouts/home_cubit/states.dart';
import 'package:esraa_news_app/screens/news_item.dart';
import 'package:esraa_news_app/screens/news_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/repo/data_sources/remote_ds.dart';

/*class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
 return [
   IconButton(onPressed:() {

   }, icon:Icon(Icons.search))
 ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
 return IconButton(onPressed:() {

 }, icon:Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(RemoteDs())..getNews(search: query),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetNewsLoadingState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          else if(state is HomeGetNewsSuccessState){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return NewsTab();
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("Suggetion");
  }
  
}*/