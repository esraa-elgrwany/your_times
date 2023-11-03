import 'package:esraa_news_app/models/category-model.dart';
import 'package:flutter/material.dart';
import 'package:esraa_news_app/shared/styles/my_theme.dart';
class CategoryItem extends StatelessWidget{
CategoryModel cate;
CategoryItem(this.cate);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:cate.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomRight: cate.rigth?Radius.circular(25):Radius.circular(0),
          bottomLeft: cate.rigth?Radius.circular(0):Radius.circular(25),
      ),
        border: Border.all(
          color: Colors.transparent
        )
      ),
      child: Column(
         children: [
          Expanded(child: Image.asset(cate.img)),
           Text(cate.name,style: Theme.of(context).textTheme.bodyLarge,),
         ],
      ),
    );
  }
}
