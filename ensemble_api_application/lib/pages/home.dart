import 'package:ensemble_api_application/components/app_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebeeff),
      drawer: AppDrawer(

      ),
      appBar: AppBar(
        title: Text("Home"),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "/about");
        },
        icon: Icon(Icons.error_outline),
        label: Text("About"),
        

      ),
      body: Center(
        child: Column(
          children: [
            Image(image: AssetImage("images/home.jpg")),
            Container(
              margin: EdgeInsets.fromLTRB(20,40,20,20),
              height: 300,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.6,

                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  MaterialButton(
                    height: 20,
                    color: Color(0xffbac3fe),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 10, 5, 10),
                      child: Text("Contacts",
                        style: TextStyle(color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "monospace"),),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, "/contacts");

                    },
                  ),
                  MaterialButton(
                    height: 20,
                    color: Color(0xffbac3fe),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 10, 5, 10),
                      child: Text("Github",
                        style: TextStyle(color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "monospace"),),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, "/githubUsers");

                    },
                  ),
                  MaterialButton(
                    height: 20,
                    color: Color(0xffbac3fe),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 10, 5, 10),
                      child: Text("News",
                        style: TextStyle(color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "monospace"),),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, "/news");

                    },
                  ),
                  MaterialButton(
                    height: 20,
                    color: Color(0xffbac3fe),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 10, 5, 10),
                      child: Text("Covid",
                        style: TextStyle(color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "monospace"),),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, "/covid");

                    },
                  ),
                ],),
            ),

          ],
        ),
      ),
    );
  }
}