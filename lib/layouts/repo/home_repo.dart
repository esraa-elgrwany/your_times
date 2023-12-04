import 'package:esraa_news_app/models/NewsResponse.dart';
import 'package:esraa_news_app/models/SourceResponse.dart';

abstract class HomeRepo{
  Future<SourceResponse> getSources(String categoryId) ;
  Future<NewsResponse> getNews( {String? sourceId,String? search}) ;
}