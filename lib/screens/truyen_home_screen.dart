import 'package:CoraEnglish/widgets/truyen_de_cu_widget.dart';
import 'package:flutter/material.dart';

class TruyenHomeScreen extends StatefulWidget {
  TruyenHomeState createState() => TruyenHomeState();
}

class TruyenHomeState extends State {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Net Truyen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            appBar: AppBar(
              title:
                  Image.asset('assets/logo-nettruyen.png', fit: BoxFit.cover),
              centerTitle: false,
              backgroundColor: Colors.purple[900],
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.line_style),
                  onPressed: () {},
                )
              ],
            ),
            body: Column(
              children: [TruyenDeCuWidget()],
            )));
  }
}
