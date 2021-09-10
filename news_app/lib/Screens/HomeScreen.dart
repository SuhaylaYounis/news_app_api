import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/Const.dart';
import 'package:news_app/Services/Functions.dart';
import 'package:news_app/Widgets/CategoriesList.dart';
import 'package:news_app/Services/Api.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Column(
        children: [
          //title
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 10, left: 10, right: 20),
              child: Text("Choose from news categories",
                  style: TextStyle(
                      color: black,
                      fontSize: fontTitle,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          //lists of the categories
          Container(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListView(
                //specifying the scroll direction of the list
                scrollDirection: Axis.horizontal,
                children: [
                  CategoriesList(
                      textCategories: "General",
                      categories: "general",
                      colorButton: yellow),
                  CategoriesList(
                      textCategories: "Sports",
                      categories: "sports",
                      colorButton: green),
                  CategoriesList(
                      textCategories: "Entertainment",
                      categories: "entertainment",
                      colorButton: blue),
                 CategoriesList(
                      textCategories: "Science",
                      categories: "science",
                      colorButton: orange),
                  CategoriesList(
                      textCategories: "Business",
                      categories: "business",
                      colorButton: Colors.blueAccent),
                  CategoriesList(
                      textCategories: "Health",
                      categories: "health",
                      colorButton: red),

                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 1, left: 20, right: 20),
              child: Text("Latest News",
                  style: TextStyle(
                      color: black,
                      fontSize: fontBigger,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(1.0),
              child: FutureBuilder(
                future: api.getArticles(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.data == Null) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: red,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Functions.openLink("${snapshot.data[i].url}");
                          },
                          child: Card(
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 80,
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Image.network((snapshot
                                                        .data[i].urlToImage ==
                                                    null)
                                                ? "https://hiwhats.com/CustomImage/blog/780/450/4c0938daa89274afdef661ecd063c8b6.jpg"
                                                : snapshot.data[i].urlToImage),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${snapshot.data[i].title}",
                                              style: TextStyle(
                                                  color: black,
                                                  fontSize: fontSubtitle),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              //share button
                                              IconButton(
                                                onPressed: () {
                                                  Functions.shareLink(
                                                      "${snapshot.data[i].url}");
                                                },
                                                icon: Icon(Icons.share),
                                                iconSize: 25,
                                              ),
                                              //copy button
                                              IconButton(
                                                onPressed: () {
                                                  Functions.copyLink(
                                                      "${snapshot.data[i].url}");
                                                  final snackBar = SnackBar(
                                                      content: Text(
                                                          "Copied to clipboard")
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                                icon: Icon(Icons.copy),
                                                iconSize: 25,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
