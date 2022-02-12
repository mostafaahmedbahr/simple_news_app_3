import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_news_app_3/cubit/network/remotly/dio_helper.dart';
import 'package:simple_news_app_3/cubit/states.dart';
import 'package:simple_news_app_3/modules/business_screen.dart';
import 'package:simple_news_app_3/modules/science_screen.dart';
import 'package:simple_news_app_3/modules/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex= 0;

  void changeBottomNav(index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<Widget> screens = [
    SportsScreen(),
    ScienceScreen(),
    BusinessScreen(),
  ];

  List business=[];

  void getBusinessData()
  {
    DioHelper.getData(
      path: "v2/top-headlines",
      query: {
        "country":"eg",
        "category":"business",
        "apiKey":"061656a4c0e04cf3add75a8a2eecb614",
      },
    ).then((value){
      print(value.data.toString());
      business = value.data["articles"];
      emit(getBusinessDataSucessState());
    }
    ).catchError((error)
    {
      print("errrrrrr ${error.toString()}");
    },
    );
    emit(getBusinessDataErrorState());
  }

  List <dynamic>science=[];

  void getSciencsData()
  {
    DioHelper.getData(
      path: "v2/top-headlines",
      query: {
        "country":"eg",
        "category":"science",
        "apiKey":"061656a4c0e04cf3add75a8a2eecb614",
      },
    ).then((value){
      print(value.data.toString());
      science = value.data["articles"];
      emit(getScienceDataSucessState());
    }
    ).catchError((error)
    {
      print("errrrrrr ${error.toString()}");
    },
    );
    emit(getScienceDataErrorState());
  }

  List  sports=[];

  void getSportsData()
  {
    DioHelper.getData(
      path: "v2/top-headlines",
      query: {
        "country":"eg",
        "category":"sports",
        "apiKey":"061656a4c0e04cf3add75a8a2eecb614",
      },
    ).then((value){
      print(value.data.toString());
      sports = value.data["articles"];
      emit(getSportsDataSucessState());
    }
    ).catchError((error)
    {
      print("errrrrrr ${error.toString()}");
    },
    );
    emit(getSportsDataErrorState());
  }



}