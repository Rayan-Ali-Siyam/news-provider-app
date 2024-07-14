import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/constants/url.dart';
import 'package:news_api/models/news_model.dart';

class APIManager {
  Future<NewsModel> getNewsData(BuildContext context) async {
    var client = http.Client();
    NewsModel newsModel;

    try {
      var response = await client.get(Uri.parse(Url.newsUrl));
      if (response.statusCode == 200) {
        String jsonString = response.body;
        Map jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
