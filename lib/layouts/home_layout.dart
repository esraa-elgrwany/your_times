import 'package:esraa_news_app/layouts/home_cubit/cubit.dart';
import 'package:esraa_news_app/layouts/repo/data_sources/remote_ds.dart';
import 'package:esraa_news_app/models/category-model.dart';
import 'package:esraa_news_app/screens/Drawer_tab.dart';
import 'package:esraa_news_app/screens/category_tab.dart';
import 'package:esraa_news_app/screens/news_tab.dart';
import 'package:esraa_news_app/screens/search/news_search.dart';
import 'package:esraa_news_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "homeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool search = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> category = CategoryModel.getCategory();
    return  Scaffold(
          backgroundColor:Theme.of(context).colorScheme.onSecondary,
          drawer: DrawerTab(onDrawerClick),
          appBar: search ?
          AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            backgroundColor: green,
            titleTextStyle:
            GoogleFonts.exo(color: Colors.white, fontSize: 22),
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            title: Container(
              margin: EdgeInsets.all(8),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {

                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                      onPressed: () {
                        HomeCubit.get(context).getNews(search: searchController.text);
                        setState(() {
                        });
                      }, icon: Icon(Icons.search)),
                  suffixIconColor: green,
                  prefixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                        search = false;
                        setState(() {});
                      },
                      icon: Icon(Icons.close)),
                  prefixIconColor: green,
                  hintText: "Search Artical",
                  hintStyle: TextStyle(color: green),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: green,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: green,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          )
              : AppBar(
            centerTitle: true,
            backgroundColor: green,
            titleTextStyle:
            GoogleFonts.exo(color: Colors.white, fontSize: 22),
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            title: Text(AppLocalizations.of(context)!.appTitle),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: IconButton(
                    onPressed: () {
                      search = true;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.search,
                    )),
              )
            ],
          ),
          body:
          categoryModel == null
              ? searchController.text.isEmpty?
          CategoryTab(category, onCatClick)
              : NewsSearch()
         :searchController.text.isEmpty?
          NewsTab(
            categoryModel!,
          )
          :NewsSearch()
    );
  }

  CategoryModel? categoryModel = null;

  onCatClick(category) {
    categoryModel = category;
    setState(() {});
  }

  onDrawerClick(id) {
    if (id == DrawerTab.cat_id) {
      categoryModel = null;
    } else if (id == DrawerTab.set_id) {}
    setState(() {});
    Navigator.pop(context);
  }
}
