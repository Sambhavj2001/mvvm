import 'package:http/http.dart' as http;
import 'package:mvvm/models/article_model.dart';
import 'dart:convert';

class News {

  List<ArticleModel> news  = [];

  Future<void> getNews() async{

    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=07c80c2abd7948e5af5818c018df44d4";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: element["publishedAt"],
            content: element["content"],
          );
          news.add(articleModel);
        }

      });
    }


  }


}
