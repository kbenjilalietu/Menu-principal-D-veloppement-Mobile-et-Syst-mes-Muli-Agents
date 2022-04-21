import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class GithubState extends ChangeNotifier{

  // liste dynamique des utilistateurs
  var users = null;

  void searchGithubUser(userKey) {
    String url = "https://api.github.com/search/users?q=${userKey}&per_page=10&page=0";
    http.get(Uri.parse(url)).then((reponse) {
       users = json.decode(reponse.body);
       notifyListeners();
    }).catchError((onError) => print(onError));
  }
}