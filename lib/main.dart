
import 'package:flutter/material.dart';
import 'package:news/components/search.dart';
import 'components/customListTile.dart';
import 'components/filterBox.dart';
import 'services/news_api.dart';

import 'model/article_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.red,
        canvasColor: Colors.black45

        /* dark theme settings */
      ),
      home: const NewsData(),
    );
  }
}

class NewsData extends StatefulWidget {


  final  query;
  final category;



  const NewsData({Key key, this.query, this.category}) : super(key: key);

  @override
  _NewsDataState createState() => _NewsDataState();
}

class _NewsDataState extends State<NewsData> {
  ApiService client = ApiService();






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('News App'),
        leading: IconButton(
          icon:Icon(Icons.filter_alt_outlined),
              onPressed: (){
              StatusDialog();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatusDialog();
                },
              );
              },

        ),
      ),
      body: Column(children: [
        const SearchWidget(),
        FutureBuilder(
          future: client.getArticle(widget.category,widget.query),
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data;
              return Expanded(
                child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) => customListTile(articles[index], context)
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },


        )
      ],)

    );
  }
}





