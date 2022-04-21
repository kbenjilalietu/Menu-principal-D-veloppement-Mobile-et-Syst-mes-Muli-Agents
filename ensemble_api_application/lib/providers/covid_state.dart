import 'dart:convert';
import 'package:ensemble_api_application/pages/covid19.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class CovidState extends ChangeNotifier{

  var covid = null;
  var covidTest = ["??","??","??","??"];
  var country = ['Morocco'];
  var countryBody = null;

  void searchCovid(String contry)
  {
    String url = "https://covid-api.mmediagroup.fr/v1/cases?country=${contry}";
    http.get(Uri.parse(url)).then((reponse){
      covid = json.decode(reponse.body);
      covidTest[0] = '${covid["All"]["updated"].toString().substring(0,10)}\n\t\t\H: ${covid["All"]["updated"].toString().substring(10,16)}';
      covidTest[1] = '${covid["All"]["confirmed"]}';
      covidTest[2] = '${covid["All"]["recovered"]}';
      covidTest[3] = '${covid["All"]["deaths"]}';

      notifyListeners();
    }).catchError((onError) {
          print(onError);

    });
  }


}