import 'package:flutter/material.dart';
import 'package:responsi_123200012/model/list_news_model.dart';
import 'package:responsi_123200012/service/base_network.dart';

class TerbaruPage extends StatefulWidget {
  const TerbaruPage({super.key});

  @override
  State<TerbaruPage> createState() => _TerbaruPageState();
}

class _TerbaruPageState extends State<TerbaruPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("CNN TERBARU")),
        body: Container(
          child: FutureBuilder(
              future: BaseNetwork.getList('terbaru'),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                if (snapshot.data == null) {
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (!snapshot.hasData) {
                  return Container(
                    child: Center(child: Text("Tidak ada data")),
                  );
                } else {
                  List<ListNewsModel> listnews = [];
                  for (var item in snapshot.data) {
                    listnews.add(ListNewsModel.fromJson(item));
                  }
                  return ListView.builder(
                      itemCount: listnews.length,
                      itemBuilder: (context, index) {
                        ListNewsModel news = listnews[index];
                        for (int i = 0; i < news.data!.posts!.length; i++)
                          return Card(
                            child: ListTile(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => DetailKarakterPage(
                                //           name:
                                //               snapshot.data[index].toLowerCase()),
                                //     ));
                              },
                              leading: Image.network(
                                news.data!.posts![i].thumbnail!,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              ),
                              title: Text(news.data!.posts![i].title!),
                            ),
                          );
                      });
                }
              }),
        ));
  }
}
