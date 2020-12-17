import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/model/category.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Category> categories = List<Category>();
  @override
  void initState() {
    categories = getCategoryData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsApp"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 80,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    categories[index].imgUrl,
                    categories[index].label,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imgUrl, label;
  CategoryTile(this.imgUrl, this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            imgUrl,
            height: 60,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.black26,
          ),
          height: 60,
          width: 120,
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ]),
    );
  }
}
