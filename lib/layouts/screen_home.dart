import 'package:CoraEnglish/layouts/sreen_test.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cora English',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CORA ENGLISH'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.line_weight),
            onPressed: () {},
          ),
        ),
        body: Container(
          child: Center(
              child: GridView.count(
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                      "TEST ALL",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pinkAccent,
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  print('uuuu');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: Text(
                    'LISTENING',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange[800],
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    print('BBBBB');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                      'SPEAKING',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal,
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  print('U');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: Text('READING',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('HIHI');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: Text(
                    'WRITING',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple,
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
