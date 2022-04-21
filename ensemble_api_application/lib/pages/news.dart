
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


import 'package:intl/intl.dart';
import '../providers/news_state.dart';
import '../web/web_view_container_news.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class News extends StatelessWidget{

  TextEditingController keyController = TextEditingController();

  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //final format = DateFormat("yyyy-MM-dd");
    return Scaffold(
      appBar: AppBar(title: const Text("News")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shadowColor: Colors.indigo,
              child: Padding(padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: keyController,
                      decoration: InputDecoration(
                          labelText: "key",
                          prefixIcon: const Icon(Icons.key_off),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(height: 10),

                    DateTimeField(
                      controller: dateController,
                      decoration: InputDecoration(
                          labelText: "Date",
                          prefixIcon: const Icon(Icons.access_time),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      format: DateFormat("yyyy-MM-dd"),
                      onShowPicker: (context, currentValue){
                        return showDatePicker(
                            context: context,
                            //?? Called also null operator. This operator returns expression on its left,
                            // except if it is null, and if so, it returns right
                            initialDate: currentValue ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now());
                      },
                    ),

                    const SizedBox(height: 14),
                    MaterialButton(
                      onPressed: (){
                          Provider.of<NewsState>(context, listen: false).searchNews(keyController.text, dateController.text);

                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.indigo,
                      textColor: Colors.white,
                      minWidth: 316,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.login),
                          SizedBox(width: 10,),
                          Text("Search", style: TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
                  ],),
              ),
            ),
            Expanded(
              child: Consumer<NewsState>(
                builder: (context, newsState, child){
                  return ListView.builder(
                      itemCount: newsState.news==null||newsState.news["articles"]==null?0:newsState.news["articles"].length,
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: Colors.indigo,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WebViewContainerNews(newsState.news["articles"][index]["title"],newsState.news["articles"][index]["url"]))

                              );},

                            child: Row(
                              children: [
                                Expanded(
                                    child: Padding(padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children:[
                                              Text(newsState.news["articles"][index]["publishedAt"].toString().substring(0,10),
                                              style: const TextStyle(color: Colors.indigo,fontFamily: "fantasy", fontWeight: FontWeight.bold),),
                                              const SizedBox(width: 30,),

                                              Text("h : "+newsState.news["articles"][index]["publishedAt"].toString().substring(12,16),
                                                style: const TextStyle(color: Color(0xffbac3fe),fontFamily: "fantasy", fontWeight: FontWeight.bold),),

                                          ]),
                                          const SizedBox(height: 8),
                                          Text(newsState.news["articles"][index]["title"],
                                            maxLines: 3,textAlign:
                                            TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontFamily: "sans-serif"),),
                                        ],),
                                    )
                                ),
                                Container(
                                  child: Image(
                                    image: newsState.news["articles"][index]["urlToImage"]==null?const NetworkImage("https://zupimages.net/viewer.php?id=22/14/tdt5.jpg"):NetworkImage(newsState.news["articles"][index]["urlToImage"]),
                                    width: 150,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),],
                            ),
                          ),
                        );
                      });
                },
              )
            ),],
        ),
      ),
    );
  }
}