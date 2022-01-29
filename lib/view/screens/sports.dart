import 'package:flutter/material.dart';
import 'package:newss_app/models/news_model.dart';
import 'package:newss_app/service/news_service.dart';

class Sports extends StatelessWidget {
  Sports({Key key}) : super(key: key);
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: service.getArticle(cat: 'sports'),
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 220,
                              child: Image.network(
                                articles[index].urlToImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              articles[index].title,
                              style:
                              const TextStyle(color: Colors.black, fontSize: 25),
                            ),
                            Text(
                              articles[index].description,
                              style:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
