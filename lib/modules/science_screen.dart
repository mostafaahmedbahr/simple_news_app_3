import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_news_app_3/components/build_list_items.dart';
import 'package:simple_news_app_3/components/item.dart';
import 'package:simple_news_app_3/cubit/cubit.dart';
import 'package:simple_news_app_3/cubit/states.dart';
class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).science;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return ConditionalBuilder(
          condition: list.isNotEmpty,
          builder:(context)=> buildListItems(list),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },

    );
  }
}
