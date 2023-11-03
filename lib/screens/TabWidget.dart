import 'package:esraa_news_app/models/SourceResponse.dart';
import 'package:esraa_news_app/screens/chip.dart';
import 'package:esraa_news_app/screens/news_item.dart';
import 'package:esraa_news_app/shared/network/remote/api_manager.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget{
  List<Sources> sources;
  String? search;
   TabWidget(this.sources,{this.search});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(length:widget.sources.length , child:
        TabBar(
          isScrollable: true,
          onTap: (index) {
            selectedIndex=index;
            setState(() {
            });
          },
          indicatorColor: Colors.transparent,
          tabs:
          widget.sources.map((source) =>Tab(
            child: ChipItem(source,widget.sources.indexOf(source)==selectedIndex),
          ) ).toList()
        )),
        FutureBuilder(future:ApiManager.getNews(widget.sources[selectedIndex].id??"",
            search:widget.search ) ,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              }
              var newsList = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return NewsItem(newsList[index]);
                },
                  itemCount: newsList.length,
                ),
              );
            } ),
      ],
    ) ;
  }
}
