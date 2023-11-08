import 'dart:convert';

import 'package:esraa_news_app/layouts/repo/home_repo.dart';
import 'package:esraa_news_app/models/NewsResponse.dart';
import 'package:esraa_news_app/models/SourceResponse.dart';
import 'package:esraa_news_app/shared/components/constants.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class RemoteDs implements HomeRepo{
  @override
  Future<NewsResponse> getNews(String sourceId, {String? search}) async{
    Uri url = Uri.https(baseUrl, "/v2/everything",
        {"apiKey": apiKey,
          "sources":sourceId ,
          "q": search
        });
    Response response = await http.get(url);
    try {
      var jsonData = jsonDecode(response.body);
      NewsResponse newsResponse = NewsResponse.fromJson(jsonData);
      return newsResponse;
    } catch (e) {
      throw Exception();
    }
  }
  @override
  Future<SourceResponse> getSources(String categoryId) async{
    Uri url = Uri.https(baseUrl, "v2/top-headlines/sources",
        {"apiKey": apiKey,"category":categoryId,
        });
    var response = await http.get(url);
    try{
      var jsonData=jsonDecode(response.body);
      SourceResponse sourceResponse=SourceResponse.fromJson(jsonData);
      return sourceResponse;
  }catch(e) {
      throw Exception();
    }
    }

}