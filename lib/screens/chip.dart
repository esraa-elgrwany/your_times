import 'package:esraa_news_app/models/SourceResponse.dart';
import 'package:esraa_news_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class ChipItem extends StatefulWidget{
 Sources sources;
 bool select=false;
 ChipItem(this.sources,this.select);

  @override
  State<ChipItem> createState() => _ChipItemState();
}

class _ChipItemState extends State<ChipItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:8,horizontal: 16),
      decoration: BoxDecoration(
        color: widget.select?green:Colors.white,
          borderRadius: BorderRadiusDirectional.circular(20),
        border: Border.all(
         width: 2,
          color: green
        )
      ),
      child: Text(widget.sources.name??"",style:
          Theme.of(context).textTheme.bodySmall!.copyWith(
            color: widget.select?Colors.white:green,
          )),
    );
  }
}

