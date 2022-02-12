import 'package:flutter/material.dart';
import 'package:simple_news_app_3/modules/web_view_screen.dart';

Widget buildItem(Map model,context
        // String imgUrl,
        // String title,
        // String time,
        ) =>
    InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
            builder: (context)=>WebViewScreen(url: model["url"])));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 150,
          child: Row(
            children: [
              model["urlToImage"] == null
                  ? Image(
                      image: NetworkImage(
                        " https://st3.depositphotos.com/1322515/35964/v/1600/depositphotos_359648638-stock-illustration-image-available-icon.jpg",
                      ),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    )
                  : Image(
                      image: NetworkImage(
                        "${model["urlToImage"]}",
                      ),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        model["title"],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      model["publishedAt"],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
