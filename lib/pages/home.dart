import 'package:flutter/material.dart';
import 'package:responsi_123200012/pages/b_terbaru.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TerbaruPage(),
                            ));
                      },
                      child: Text("TERBARU")),
                  ElevatedButton(onPressed: () {}, child: Text("NASIONAL")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("OLAHRAGA")),
                  ElevatedButton(onPressed: () {}, child: Text("TEKNOLOGI")),
                ],
              )
            ]),
      ),
    );
  }
}
