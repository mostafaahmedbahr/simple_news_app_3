import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_news_app_3/cubit/cubit.dart';
import 'package:simple_news_app_3/cubit/network/remotly/dio_helper.dart';
import 'package:simple_news_app_3/cubit/states.dart';
class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(
                onPressed: (){},
                  icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.dark_mode_outlined),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: "Sports",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science),
                label: "Science",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: "Business",
              ),

            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){

            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
