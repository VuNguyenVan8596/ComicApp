import 'package:CoraEnglish/widgets/truyen_de_cu_widget.dart';
import 'package:CoraEnglish/widgets/truyen_doc_nhieu_widget.dart';
import 'package:CoraEnglish/widgets/truyen_moi_cap_nhat_widget.dart';
import 'package:flutter/material.dart';

class TruyenHomeScreen extends StatefulWidget {
  TruyenHomeState createState() => TruyenHomeState();
}

class TruyenHomeState extends State {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 2000);
  // This widget is the root of your application.

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  Future _scrollToTop() async {
    _scrollController.animateTo(2000,
        duration: Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lens Comic',
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
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: _scrollController,
                reverse: true,
                child: Column(
                  children: [
                    TruyenDeCuWidget(),
                    TruyenDocNhieuWidget(),
                    TruyenMoiCapNhatWidget(),
                    FlatButton(
                        onPressed: () {
                          _scrollToTop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Đã hết nội dung hiển thị. Bấm vào để lên đầu trang.',
                              style: TextStyle(
                                  color: Colors.grey[400].withOpacity(1)),
                            )
                          ],
                        ))
                  ],
                ))));
  }
}
