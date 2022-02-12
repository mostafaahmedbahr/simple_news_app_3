import 'package:flutter/material.dart';
import 'package:simple_news_app_3/components/item.dart';
Widget buildListItems(list,)=>ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder: (context,index)=>buildItem(
    list[index],
      context
  ),
  separatorBuilder: (context,index)=>Divider(color: Colors.grey,height: 1,),
  itemCount: list.length,
);