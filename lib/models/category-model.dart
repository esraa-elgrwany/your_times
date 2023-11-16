import 'package:esraa_news_app/shared/styles/colors.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryModel{
  String name;
  String id;
  String img;
  Color color;
  bool rigth=true;
  CategoryModel(this.name,this.id,this.img,this.color,this.rigth);

  static List<CategoryModel> getCategory(){
    return [
      CategoryModel("Sports","sports","assets/images/sports.png" , red,false),
      CategoryModel("Politics","general","assets/images/Politics.png",darkBlue,true),
    CategoryModel("Health","health","assets/images/health.png",pink,false),
    CategoryModel("Business ","business","assets/images/bussines.png",lightBrown,true),
    CategoryModel("Enviroment","entertainment","assets/images/environment.png",blue,false),
    CategoryModel("Science","science","assets/images/science.png",yellow,true),
    ];
  }
}