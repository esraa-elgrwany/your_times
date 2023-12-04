import 'package:esraa_news_app/layouts/repo/home_repo.dart';
import 'package:esraa_news_app/models/NewsResponse.dart';
import 'package:esraa_news_app/models/SourceResponse.dart';

class LocalDs implements HomeRepo{
  @override
  Future<NewsResponse> getNews({String? sourceId, String? search}) {
    // TODO: implement getNews
    throw UnimplementedError();
  }

  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
  
}