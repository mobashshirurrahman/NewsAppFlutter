import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/views/home.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  CategoryScreen(this.category);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Article> articles = List<Article>();
  News news = News();
  getAndSetNews() async {
    await news.getNewsByCategory("in", widget.category.toLowerCase());
    articles = news.articles;
    setState(() {});
  }

  @override
  void initState() {
    getAndSetNews();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.category} News"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: articles.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return NewsTile(
              articles[index].urlToImage,
              articles[index].title,
              articles[index].description,
              articles[index].url,
            );
          },
        ),
      ),
    );
  }
}
