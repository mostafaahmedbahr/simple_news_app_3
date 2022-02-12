import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_news_app_3/cubit/cubit.dart';
import 'package:simple_news_app_3/cubit/network/remotly/dio_helper.dart';

import 'home_layout.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit()..getSportsData()..getSciencsData()..getBusinessData(),
      child: MaterialApp(
        theme : ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomeLayout(),
      ),
    );
  }
}
