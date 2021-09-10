import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/Const.dart';
import 'package:news_app/Services/Functions.dart';
import 'package:news_app/Widgets/CategoriesList.dart';
import 'package:news_app/Services/Api.dart';

class CategoryScreen extends StatefulWidget {
  String category;

  CategoryScreen(this.category);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30),
            child: ListTile(
              title: Text("${widget.category}",
                  style: TextStyle(
                      color: black,
                      fontSize: fontTitle,
                      fontWeight: FontWeight.w500)),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 25,
                color: black,
              ),
            ),
          ),
          //title

          Expanded(
            child: Container(
              padding: EdgeInsets.all(1.0),
              child: FutureBuilder(
                future: api.getArticlesByCategory("${widget.category}"),
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
                                                : snapshot.data[i].urlToImage,
                                              fit: BoxFit.fitWidth,),
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
                                                      "${snapshot.data[i]
                                                          .url}");
                                                },
                                                icon: Icon(Icons.share),
                                                iconSize: 25,
                                              ),
                                              //copy button
                                              IconButton(
                                                onPressed: () {
                                                  Functions.copyLink(
                                                      "${snapshot.data[i]
                                                          .url}");
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
