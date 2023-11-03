import 'package:esraa_news_app/models/category-model.dart';
import 'package:esraa_news_app/screens/category_item.dart';
import 'package:flutter/material.dart';
import 'package:esraa_news_app/shared/styles/my_theme.dart';
class CategoryTab extends StatelessWidget {
  List<CategoryModel>category;
  Function onClick;
  CategoryTab(this.category,this.onClick);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            """Pick your category 
 of interest""",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
       SizedBox(height: 10,),
      Expanded(
              child: GridView(gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              crossAxisSpacing:18,
              mainAxisSpacing: 18),
                children:category.map((cate) =>InkWell(
                  onTap: () {
                    onClick(cate);
                  },
                    child: CategoryItem(cate)) ).toList()
              ),
            ),
        ],
      ),
    );
  }
}
