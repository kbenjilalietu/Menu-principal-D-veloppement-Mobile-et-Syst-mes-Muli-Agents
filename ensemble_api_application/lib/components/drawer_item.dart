import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget{
  Icon icon;
  String route;
  String title;
  DrawerItem(this.route, this.icon, this.title);
  @override
  Widget build(BuildContext context) {
   return  ListTile(
     onTap: (){
       Navigator.popAndPushNamed(context, route);
     },
     leading: icon,
     title: Text(title),
   );
  }
}