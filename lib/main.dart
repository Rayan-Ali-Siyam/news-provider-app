import 'package:flutter/material.dart';
import 'package:news_api/pages/homepage.dart';
import 'package:news_api/providers/news_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<NewsProvider>(
          create: (_) => NewsProvider(), child: HomePage()),
    );
  }
}
