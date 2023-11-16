import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:esraa_news_app/layouts/home_cubit/states.dart';
import 'package:esraa_news_app/layouts/repo/home_repo.dart';
import 'package:esraa_news_app/models/NewsResponse.dart';
import 'package:esraa_news_app/models/SourceResponse.dart';
import 'package:esraa_news_app/models/category-model.dart';
import 'package:esraa_news_app/screens/Drawer_tab.dart';
import 'package:esraa_news_app/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HomeCubit extends Cubit<HomeStates> {
  HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitState());

  List<Sources>sourcesList=[];
  List<Articles> articlesList=[];
  int selectedIndex=0;
//  bool searched=false;
//  String search='';

 // TextEditingController searchController=TextEditingController();

  static HomeCubit get(context) => BlocProvider.of(context);

  changeSource(int value){
    emit(HomeInitState());
   selectedIndex=value;
   emit(HomeChangeSource());
  }

/*  getSearch(String search1){search=search1;
    emit(HomeGetSearch());
  }
  setSearch(){
   // emit(HomeInitState());
   searched=!searched;
   emit(HomeSetSearch());
  }*/

   Future <void> getSources(String catId) async {
     emit(HomeGetSourcesLoadingState());
    try{
     SourceResponse sourceResponse=await homeRepo.getSources(catId);
    sourcesList=sourceResponse.sources??[];
    emit(HomeGetSourcesSuccessState());
    }catch (e){
    emit(HomeGetSourcesErrorState());
      throw e;
    }

  }

   Future <void> getNews({String? search}) async {
     emit(HomeGetNewsLoadingState());
     try{
    NewsResponse newsResponse=await homeRepo.
    getNews(sourcesList[selectedIndex].id??"",
        search:search);
      articlesList=newsResponse.articles??[];
      emit(HomeGetNewsSuccessState());
    }catch(e){
      emit(HomeGetNewsErrorState());
      throw e;
    }
  }



  /*onCatClick(category) {
    categoryModel = category;
  emit( HomeGetCategory());
  }

  onDrawerClick(id) {
    if (id == DrawerTab.cat_id) {
      categoryModel = null;
    } else if (id == DrawerTab.set_id) {}
   emit(HomeGetDrawer());
    Navigator.pop;
  }*/
}
