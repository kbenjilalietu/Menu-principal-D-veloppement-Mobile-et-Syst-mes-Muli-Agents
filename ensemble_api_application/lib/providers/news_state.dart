import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class NewsState extends ChangeNotifier{

  var news = null;

  void searchNews(String key, String date)
  {
    String url = "https://newsapi.org/v2/everything?q=${key}&from=${date}&sortBy=publishedAt&apiKey=2344af3a20884e18a2d000a3414bdce5";
    http.get(Uri.parse(url)).then((reponse){
        news = json.decode(reponse.body);
        notifyListeners();
        print(url);

    }).catchError((onError)=>print(onError));
  }

}