
import 'package:ensemble_api_application/providers/githup-state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../web/web_view_container_news.dart';

class GithunUsers extends StatelessWidget{
  TextEditingController textUsernameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Users"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shadowColor: Colors.grey,
              child:  Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: textUsernameController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_search),
                                hintText: "Search about",
                                labelText: "I search about",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                        SizedBox(width: 10),
                        MaterialButton(
                            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.indigo,
                            textColor: Colors.white,
                            minWidth: 65,
                            onPressed: () {
                              Provider.of<GithubState>(context, listen: false).searchGithubUser(textUsernameController.text==""?"Monde":textUsernameController.text);

                            },
                            child: Icon(Icons.search)),
                      ],
                    ),
                  )
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 10, 2, 2),
                child: Consumer<GithubState>(
                  builder: (context, githubState, child){
                    return ListView.builder(
                        itemCount: githubState.users == null || githubState.users["items"] == null ? 0 : githubState.users["items"].length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                  NetworkImage(githubState.users["items"][index]["avatar_url"]),
                                ),
                                title: Text(githubState.users["items"][index]["login"]),
                                trailing: IconButton(onPressed: ()
                                {
                                   Navigator.push(context,MaterialPageRoute(
                                   builder: (context) =>
                                   WebViewContainerNews(githubState.users["items"][index]["login"],githubState.users["items"][index]["html_url"])));
                                },
                                    icon: Icon(Icons.link, color: Colors.indigo,))
                              ),
                            ),
                          );
                        });
                  },
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
