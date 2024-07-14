import 'package:flutter/material.dart';
import 'package:news_api/models/news_model.dart';
import 'package:news_api/providers/news_provider.dart';
import 'package:news_api/services/api_manager.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // _newsModel = APIManager().getNewsData();
    Provider.of<NewsProvider>(context, listen: false).getNews(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        centerTitle: true,
      ),
      body: newsProvider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: newsProvider.news.articles.length,
              itemBuilder: (context, index) {
                var article = newsProvider.news.articles[index];
                return Container(
                  margin: EdgeInsets.all(8),
                  height: 100,
                  child: Row(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            article.urlToImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              article.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
                return null;
                return null;
                return null;
                return null;
              },
            ),
    );
  }
}
