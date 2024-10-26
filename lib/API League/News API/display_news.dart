import 'package:flutter/material.dart';

import 'news_detail_screen.dart';
import 'news_model.dart';
import 'service.dart';

class TopNewsScreen extends StatefulWidget {
  const TopNewsScreen({super.key});

  @override
  _TopNewsScreenState createState() => _TopNewsScreenState();
}

class _TopNewsScreenState extends State<TopNewsScreen> {
  late Future<TopNews?> topNews;

  @override
  void initState() {
    super.initState();
    topNews = ApiService().fetchTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
         backgroundColor: Colors.blue[100],
        title: const Text("Top News"),
      ),
      body: FutureBuilder<TopNews?>(
        future: topNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.topNews.isEmpty) {
            return const Center(child: Text("No news data available"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.topNews.length,
              itemBuilder: (context, index) {
                final newsItem = snapshot.data!.topNews[index].news;
                return Column(
                  children: newsItem.map((news) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 1,color: Colors.white,
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              news.image,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            news.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailScreen(
                                  image: news.image,
                                  text: news.text,
                                  title:news.title
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
