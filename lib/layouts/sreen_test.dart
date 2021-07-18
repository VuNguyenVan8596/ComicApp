import 'package:CoraEnglish/layouts/screen_exam.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Card _tile(String title, String subtitle, String profileImage) => Card(
        color: Colors.brown[300],
        child: ListTile(
          title: Text(title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
          subtitle: Text(subtitle,
              style: TextStyle(
                color: Colors.yellowAccent,
              )),
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 64,
              maxHeight: 64,
            ),
            child: Image.asset(profileImage, fit: BoxFit.cover),
          ),
          onTap: () {
            if (title == 'Conditional sentences') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ExamScreen(
                          title: title,
                        )),
              );
            } else {
              print('AAAAAAAAAAAA');
            }
          },
        ));
    return Scaffold(
      appBar: AppBar(
        title: Text("Cora English - Test"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
              child: ListView(
        children: [
          _tile('Conditional sentences', '10 questions', 'lib/images/book.jpg'),
          _tile('Passive voice', '15 questions', 'lib/images/book.jpg'),
          _tile('Active sentence', '25 questions', 'lib/images/book.jpg')
        ],
      ))),
    );
  }
}
