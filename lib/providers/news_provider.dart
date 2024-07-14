import 'package:flutter/cupertino.dart';
import 'package:news_api/models/news_model.dart';
import 'package:news_api/services/api_manager.dart';

class NewsProvider extends ChangeNotifier {
  NewsModel news = NewsModel();
  bool loading = false;

  Future<void> getNews(BuildContext context) async {
    loading = true;
    news = await APIManager().getNewsData(context);
    loading = false;

    notifyListeners();
  }
}
