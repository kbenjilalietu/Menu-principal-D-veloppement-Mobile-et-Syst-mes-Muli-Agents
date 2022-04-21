import 'package:ensemble_api_application/pages/about.dart';
import 'package:ensemble_api_application/pages/contacts.dart';
import 'package:ensemble_api_application/pages/covid19.dart';
import 'package:ensemble_api_application/pages/github_users.dart';
import 'package:ensemble_api_application/pages/home.dart';
import 'package:ensemble_api_application/pages/news.dart';
import 'package:ensemble_api_application/pages/test.dart';
import 'package:ensemble_api_application/providers/contacts_state_management.dart';
import 'package:ensemble_api_application/providers/covid_state.dart';
import 'package:ensemble_api_application/providers/githup-state.dart';
import 'package:ensemble_api_application/providers/news_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>ContactsStateManagement()),
          ChangeNotifierProvider(create: (context)=>GithubState()),
          ChangeNotifierProvider(create: (context)=>NewsState()),
          ChangeNotifierProvider(create: (context)=>CovidState()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.indigo,
              textTheme: const TextTheme(
                  bodyText1: TextStyle(color:Colors.indigo ,fontSize: 20, fontFamily: 'RobotoMono'),

              ),
            iconTheme: const IconThemeData(
              color: Color(0xffbac3fe),
              size: 28,
            ),
          ),
          routes: {
            "/":(context)=>Home(),
            "/contacts":(context)=>Contacts(),
            "/githubUsers":(context)=>GithunUsers(),
            "/news":(context)=>News(),
            "/covid":(context)=>Covid19(),
            "/about":(context)=>About(),
          },
        ),
    );
  }

}