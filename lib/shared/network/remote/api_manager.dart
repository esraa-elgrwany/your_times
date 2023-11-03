import 'dart:convert';

import 'package:esraa_news_app/models/NewsResponse.dart';
import 'package:esraa_news_app/models/SourceResponse.dart';
import 'package:esraa_news_app/shared/components/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiManager {
 static Future <SourceResponse> getSources(String catId) async {
    Uri url = Uri.https(baseUrl, "v2/top-headlines/sources",
        {"apiKey": apiKey,"category":catId,
        });
    Response response = await http.get(url);
    var jsonData=jsonDecode(response.body);
    SourceResponse data=SourceResponse.fromJson(jsonData);
    return data;
  }

 static Future <NewsResponse> getNews(String sourceId,{String? search}) async {
   Uri url = Uri.https(baseUrl,"/v2/everything",
       {"apiKey": apiKey,
         "sources": sourceId ,
         "q":search
       });
   Response response = await http.get(url);
   var jsonData=jsonDecode(response.body);
   NewsResponse newsData=NewsResponse.fromJson(jsonData);
   return newsData;
 }
}
