import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/Const.dart';
import 'package:news_app/Services/Functions.dart';
import 'package:news_app/Widgets/CategoriesList.dart';
import 'package:share/share.dart';

import 'package:clipboard/clipboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


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
                      textCategories: "Political",
                      categories: "political",
                      colorButton: blue),
                  CategoriesList(
                      textCategories: "Beauty",
                      categories: "beauty",
                      colorButton: orange),
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
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Functions.openLink(
                          "https://www.youm7.com/story/2021/9/6/حسام-حسن-يكشف-لـ-اليوم-السابع-حقيقة-اقترابه-من-تدريب/5452256");
                    },
                    child: Card(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.network(
                                  "https://img.youm7.com/large/202010191213431343.jpg",
                                  fit: BoxFit.fill),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "حسام حسن يكشف لـ\"اليوم السابع\" حقيقة اقترابه من تدريب منتخب مصر - اليوم السابع",
                                style: TextStyle(
                                    color: black, fontSize: fontSubtitle),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //share button
                                IconButton(
                                  onPressed: () {
                                    Functions.shareLink(
                                        "https://www.youm7.com/story/2021/9/6/حسام-حسن-يكشف-لـ-اليوم-السابع-حقيقة-اقترابه-من-تدريب/5452256");
                                  },
                                  icon: Icon(Icons.share),
                                  iconSize: 25,
                                ),
                                //copy button
                                IconButton(
                                  onPressed: () {
                                    Functions.copyLink(
                                            "https://www.youm7.com/story/2021/9/6/حسام-حسن-يكشف-لـ-اليوم-السابع-حقيقة-اقترابه-من-تدريب/5452256");
                                    final snackBar =SnackBar(content: Text("Copied to clipboard"));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Functions.openLink(
                          "https://www.elmostaqbal.com/542179/2021/09/06/ميمي-جمال-وبناتها-وأحفادها-ضيوف-صاحبة/");
                    },
                    child: Card(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.network(
                                  "https://www.elmostaqbal.com/elmostaqbal/uploads/2021/09/www.elmostaqbal.com_2021-09-06_21-28-09_007224.jpg",
                                  fit: BoxFit.fill),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ميمي جمال وبناتها وأحفادها ضيوف \"صاحبة السعادة\" غدا - المستقبل",
                                style: TextStyle(
                                    color: black, fontSize: fontSubtitle),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //share button
                                IconButton(
                                  onPressed: () {
                                    Functions.shareLink(
                                        "https://www.elmostaqbal.com/542179/2021/09/06/ميمي-جمال-وبناتها-وأحفادها-ضيوف-صاحبة/");
                                  },
                                  icon: Icon(Icons.share),
                                  iconSize: 25,
                                ),
                                //copy button
                                IconButton(
                                  onPressed: () {
                                    Functions.copyLink(
                                            "https://www.elmostaqbal.com/542179/2021/09/06/ميمي-جمال-وبناتها-وأحفادها-ضيوف-صاحبة/");
                                    final snackBar =SnackBar(content: Text("Copied to clipboard"));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Functions.openLink(
                          "https://www.ngmisr.com/tech/%d9%82%d9%86%d8%a8%d9%84%d8%a9-%d8%b3%d8%a7%d9%85%d8%b3%d9%88%d9%86%d8%ac-samsung-galaxy-m52-%d9%88%d8%a7%d9%84%d9%87%d8%a7%d8%aa%d9%81-%d8%a7%d9%84%d8%b4%d8%a8%d8%a7%d8%a8%d9%8a-%d8%a7%d9%84%d8%a3");
                    },
                    child: Card(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.network(
                                  "https://www.ngmisr.com/wp-content/uploads/2021/09/55-1.jpg",
                                  fit: BoxFit.fill),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "قنبلة سامسونج Samsung Galaxy M52 والهاتف الشبابي الأكثر إبداعاً بسعر مميز وبطارية ضخمة - نجوم مصرية",
                                style: TextStyle(
                                    color: black, fontSize: fontSubtitle),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //share button
                                IconButton(
                                  onPressed: () {
                                    Functions.shareLink(
                                        'check out my website https://www.ngmisr.com/tech/%d9%82%d9%86%d8%a8%d9%84%d8%a9-%d8%b3%d8%a7%d9%85%d8%b3%d9%88%d9%86%d8%ac-samsung-galaxy-m52-%d9%88%d8%a7%d9%84%d9%87%d8%a7%d8%aa%d9%81-%d8%a7%d9%84%d8%b4%d8%a8%d8%a7%d8%a8%d9%8a-%d8%a7%d9%84%d8%a3');
                                  },
                                  icon: Icon(Icons.share),
                                  iconSize: 25,
                                ),
                                //copy button
                                IconButton(
                                  onPressed: () {
                                    Functions.copyLink(
                                            "https://www.ngmisr.com/tech/%d9%82%d9%86%d8%a8%d9%84%d8%a9-%d8%b3%d8%a7%d9%85%d8%b3%d9%88%d9%86%d8%ac-samsung-galaxy-m52-%d9%88%d8%a7%d9%84%d9%87%d8%a7%d8%aa%d9%81-%d8%a7%d9%84%d8%b4%d8%a8%d8%a7%d8%a8%d9%8a-%d8%a7%d9%84%d8%a3");
                                    final snackBar =SnackBar(content: Text("Copied to clipboard"));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Functions.openLink(
                          "https://www.masrawy.com/news/news_publicaffairs/details/2021/9/6/2085248/-نوم-مجندة-وحفر-استمر-لأسابيع-تحقيقات-أولية-حول-هروب-الأسرى-الفلسطينيين");
                    },
                    child: Card(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.network(
                                  "https://media.gemini.media/img/large/2021/9/6/2021_9_6_16_25_28_271.jpg",
                                  fit: BoxFit.fill),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "نوم مجندة وحفر استمر لأسابيع تحقيقات أولية حول هروب الأسرى الفلسطينيين | مصراوى",
                                style: TextStyle(
                                    color: black, fontSize: fontSubtitle),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //share button
                                IconButton(
                                  onPressed: () {
                                    Functions.shareLink(
                                        'check out my website https://www.masrawy.com/news/news_publicaffairs/details/2021/9/6/2085248/-نوم-مجندة-وحفر-استمر-لأسابيع-تحقيقات-أولية-حول-هروب-الأسرى-الفلسطينيين');
                                  },
                                  icon: Icon(Icons.share),
                                  iconSize: 25,
                                ),
                                //copy button
                                IconButton(
                                  onPressed: () {
                                    Functions.copyLink(
                                            "https://www.masrawy.com/news/news_publicaffairs/details/2021/9/6/2085248/-نوم-مجندة-وحفر-استمر-لأسابيع-تحقيقات-أولية-حول-هروب-الأسرى-الفلسطينيين");
                                    final snackBar =SnackBar(content: Text("Copied to clipboard"));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Functions.openLink(
                          "https://www.bbc.com/arabic/art-and-culture-58458022");
                    },
                    child: Card(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.network(
                                  "https://ichef.bbci.co.uk/news/1024/branded_arabic/7045/production/_120414782_976l.jpg",
                                  fit: BoxFit.fill),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "جان بول بلموندو: نجم السينما الفرنسية الشهير يرحل عن 88 عاما - BBC Arabic",
                                style: TextStyle(
                                    color: black, fontSize: fontSubtitle),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //share button
                                IconButton(
                                  onPressed: () {
                                    Share.share(
                                        'check out my website "https://www.bbc.com/arabic/art-and-culture-58458022"');
                                  },
                                  icon: Icon(Icons.share),
                                  iconSize: 25,
                                ),
                                //copy button
                                IconButton(
                                  onPressed: () {
                                    FlutterClipboard.copy(
                                            "https://www.bbc.com/arabic/art-and-culture-58458022");
                                    final snackBar =SnackBar(content: Text("Copied to clipboard"));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
