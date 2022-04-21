import 'package:ensemble_api_application/components/drawer_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
          children: const [
              CircleAvatar(
                radius : 50,
                backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/81255636?v=4"),

              ),
              SizedBox(height: 10,),
              Text("Khadija BENJILALI"),
           ],
          )),
          DrawerItem("/", Icon(Icons.home, color: Color(0xffbac3fe),), "Home"),
          DrawerItem("/contacts", Icon(Icons.quick_contacts_dialer_rounded, color: Color(0xffbac3fe),), "Contacts"),
          DrawerItem("/githubUsers", Icon(Icons.supervisor_account, color: Color(0xffbac3fe),), "Github Users"),
          DrawerItem("/news", Icon(Icons.newspaper,color: Color(0xffbac3fe),), "News"),
          DrawerItem("/covid", Icon(Icons.business_center, color: Color(0xffbac3fe),), "Covid"),
          DrawerItem("/about", Icon(Icons.error, color: Color(0xffbac3fe),), "About"),

      ],),
    );
  }
}