import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper
{
  //https://newsapi.org/v2/top-headlines?country=eg&apiKey=061656a4c0e04cf3add75a8a2eecb614
  static Dio? dio;
  static void init()
  {
   dio = Dio(
     BaseOptions(
       baseUrl: "https://newsapi.org/",
       receiveDataWhenStatusError: true,
     ),
   );
  }

 static Future<Response> getData({
  @required String? path,
    @required Map<String , dynamic >? query,
})
 async {
    return await dio!.get(path!,queryParameters: query);
  }
}