import 'package:flutter/material.dart';
import 'package:responsi_123200012/model/list_news_model.dart';
import 'package:responsi_123200012/pages/detailberitapage.dart';
import 'package:responsi_123200012/service/base_network.dart';

class BeritaPage extends StatefulWidget {
  final String berita;
  const BeritaPage({super.key, required this.berita});

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CNN " + widget.berita.toUpperCase()),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: FutureBuilder(
              future: BaseNetwork.get(widget.berita),
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
                  ListNewsModel list = ListNewsModel.fromJson(snapshot.data);
                  return ListView.builder(
                      itemCount: list.data!.posts!
                          .length, //error tidak bisa menampilkan data
                      itemBuilder: (context, index) {
                        return Card(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailBeritaPage(
                                      judul: list.data!.posts![index].title!,
                                      pubDate:
                                          list.data!.posts![index].pubDate!,
                                      thumbnail:
                                          list.data!.posts![index].thumbnail!,
                                      description:
                                          list.data!.posts![index].description!,
                                      link: list.data!.posts![index].link!,
                                    ),
                                  ));
                            },
                            child: Row(children: [
                              Image.network(
                                list.data!.posts![index].thumbnail!,
                                width: 120,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              ),
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                          list.data!.posts![index].title!))),
                            ]),
                          ),
                        );
                      });
                }
              }),
        ));
  }
}
