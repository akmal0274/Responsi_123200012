import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBeritaPage extends StatefulWidget {
  final String judul;
  final String pubDate;
  final String thumbnail;
  final String description;
  final String link;
  const DetailBeritaPage(
      {super.key,
      required this.judul,
      required this.pubDate,
      required this.thumbnail,
      required this.description,
      required this.link});

  @override
  State<DetailBeritaPage> createState() => _DetailBeritaPageState();
}

class _DetailBeritaPageState extends State<DetailBeritaPage> {
  late String Date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Date = widget.pubDate;
  }

  String changeDate(String date) {
    String newDate = date.substring(0, 10) + ' ' + date.substring(11, 23);
    return newDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CNN News"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  widget.judul,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  DateFormat("EEEE, d MMMM y")
                      .format(DateTime.parse(changeDate(Date))),
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Image.network(
                  widget.thumbnail,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 5),
                  child: Text(widget.description)),
              Center(
                child: TextButton(
                  onPressed: () async {
                    String url = widget.link;
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    'Baca Selengkapnya...',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
