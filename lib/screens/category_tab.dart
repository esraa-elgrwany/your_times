import 'package:esraa_news_app/models/category-model.dart';
import 'package:esraa_news_app/screens/category_item.dart';
import 'package:flutter/material.dart';
import 'package:esraa_news_app/shared/styles/my_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.surface
            ),
          ),
       SizedBox(height:40.h,),
      Expanded(
              child: GridView(gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              crossAxisSpacing:24,
              mainAxisSpacing: 24),
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
