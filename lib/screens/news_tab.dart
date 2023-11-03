import 'package:esraa_news_app/screens/TabWidget.dart';
import 'package:esraa_news_app/shared/network/remote/api_manager.dart';
import 'package:flutter/material.dart';

class NewsTab extends StatelessWidget{
  String cat_Id;
  String? search;
NewsTab(this.cat_Id,{this.search});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(future: ApiManager.getSources(cat_Id),
        builder:(context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(child: Text("Something went wrong"));
          }
          var sources=snapshot.data?.sources??[];
          return TabWidget(sources,search: search,);
        },
      ),
    );
  }
}
