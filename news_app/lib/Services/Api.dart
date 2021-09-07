import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:news_app/Models/Articles.dart';

class Api {
  final String apiKey = "ecf080f2e0ee41d795b6effe95f97200";

  Future<List<Articles>> getArticles() async {
    var url = Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey');
    List<Articles> listArticle = [];
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responsebody = convert.jsonDecode(response.body)["articles"];
      print(responsebody);
      for (var u in responsebody) {
        Articles x =
            Articles(u["title"], u["discription"], u["url"], u["urlToImage"]);
        listArticle.add(x);
      }
      print ("ListAdded ---> $listArticle");
      return listArticle;
    }
    return listArticle;
  }
}
