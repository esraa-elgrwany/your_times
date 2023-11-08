import 'package:esraa_news_app/layouts/home_cubit/cubit.dart';
import 'package:esraa_news_app/layouts/home_cubit/states.dart';
import 'package:esraa_news_app/layouts/repo/data_sources/remote_ds.dart';
import 'package:esraa_news_app/models/category-model.dart';
import 'package:esraa_news_app/screens/Drawer_tab.dart';
import 'package:esraa_news_app/screens/TabWidget.dart';
import 'package:esraa_news_app/screens/category_tab.dart';
import 'package:esraa_news_app/screens/news_tab.dart';
import 'package:esraa_news_app/shared/network/remote/api_manager.dart';
import 'package:esraa_news_app/shared/styles/colors.dart';
import 'package:esraa_news_app/shared/styles/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "homeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> category = CategoryModel.getCategory();
    return BlocProvider(
      create: (context) => HomeCubit(RemoteDs()),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/pattern.png"),
                  fit: BoxFit.fill),
              color: Colors.white,
            ),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                drawer: DrawerTab(onDrawerClick),
                appBar: HomeCubit
                    .get(context)
                    .searched
                    ? AppBar(
                  toolbarHeight: 70,
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
                      //controller: searchController,
                      onChanged: (value) {
                        HomeCubit.get(context).
                        getSearch(value);
                      },
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.search)),
                        suffixIconColor: green,
                        prefixIcon: IconButton(
                            onPressed: () {
                              searchController.clear();
                              HomeCubit.get(context).setSearch();
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
                  title: Text("News App"),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                          onPressed: () {
                            HomeCubit.get(context).setSearch();
                          },
                          icon: Icon(
                            Icons.search,
                          )),
                    )
                  ],
                ),
                body: categoryModel == null
                    ? CategoryTab(category, onCatClick)
                    : NewsTab(
                  categoryModel!,
                  search: searchController.text,
                )),
          );
        },
      ),
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
