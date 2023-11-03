import 'package:esraa_news_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget{
  Function onClick;
  DrawerTab(this.onClick);
  static int cat_id=1;
  static int set_id=2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width*.6,
      color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: green,
              width: double.infinity,
              height: 100,
              child: Center(child: Text("News App!",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white
              ),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      onClick(cat_id);
                    },
                    child: Row(
                      children: [
                        IconButton(onPressed:() {
                           onClick(cat_id);
                        }, icon:Icon(Icons.list,size:25,color: grey,) ),
                        Text("Categories",style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onClick(set_id);
                    },
                    child: Row(
                      children: [
                        IconButton(onPressed:() {
                          onClick(set_id);
                        }, icon:Icon(Icons.settings,size: 25,color: grey,) ),
                        SizedBox(width: 4,),
                        Text("Setting",style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
