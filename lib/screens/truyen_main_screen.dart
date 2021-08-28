import 'dart:io';
import 'package:CoraEnglish/models/truyen_detail.dart';
import 'package:CoraEnglish/widgets/binh_luan_truyen_widget.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TruyenMainScreen extends StatefulWidget {
  final int indexCurrent;
  final TruyenDetail truyenDetail;
  TruyenMainScreen({@required this.indexCurrent, this.truyenDetail});
  @override
  TruyenMainState createState() => TruyenMainState(
      indexCurrent: this.indexCurrent, truyenDetail: truyenDetail);
}

class TruyenMainState extends State {
  bool isLoading = true;
  WebViewController _myController;
  int indexCurrent = 0;
  ChapterModel _chapterCurrent;
  TruyenDetail truyenDetail;

  TruyenMainState({@required this.indexCurrent, this.truyenDetail});

  var js = "document.getElementsByClassName('header')[0].style.display = 'none';document.getElementsByClassName('footer')[0].style.display = 'none';" +
      "document.getElementsByClassName('reading')[0].childNodes.forEach(function(item){" +
      "if (item.className != 'reading-detail box_doc' && item.className != undefined){item.style.display = 'none';}});";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _chapterCurrent = truyenDetail.chapters[indexCurrent];
  }

  //op: - => Pre
  //op: + => Next
  void nextChapter(String op) {
    if (op == '+') {
      //Thông báo là chưa có tập mới
      if (indexCurrent == truyenDetail.chapters.length - 1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Hiện chưa có chap mới."),
        ));
        return;
      }
      //indexCurrent += 1;
      ChapterModel cp = truyenDetail.chapters.elementAt(indexCurrent + 1);
      onChangeChapterTruyen(cp);
      return;
    } else {
      if (indexCurrent == 0) {
        return;
      }
      //indexCurrent -= 1;
      ChapterModel cp = truyenDetail.chapters.elementAt(indexCurrent - 1);
      onChangeChapterTruyen(cp);
      return;
    }
  }

  void onChangeChapterTruyen(ChapterModel value) {
    if (truyenDetail.chapters.indexOf(value) == indexCurrent) {
      return;
    }

    setState(() {
      _chapterCurrent = value;
      //urlCurrent = HOST + value.url;
      isLoading = true;
      _myController.loadUrl(_chapterCurrent.urlChapter);
      indexCurrent = truyenDetail.chapters.indexOf(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.purple[900],
        title: RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
              text: truyenDetail.tenTruyen, style: TextStyle(fontSize: 16)),
          maxLines: 1,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BinhLuanTruyenWidget()),
                );
              },
              icon: Icon(Icons.comment))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                  padding:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 8,
                          child: FlatButton(
                              onPressed: () {
                                nextChapter('-');
                              },
                              child: Container(
                                height: 40,
                                child: Center(
                                    child: Text(
                                  'Chapter Trước',
                                  style: TextStyle(fontSize: 10),
                                )),
                              ),
                              color: Colors.green[800],
                              textColor: Colors.white)),
                      Expanded(
                        child: SizedBox(),
                        flex: 1,
                      ),
                      Expanded(
                          flex: 10,
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black)),
                              child: Center(
                                  child: DropdownButton<ChapterModel>(
                                value: _chapterCurrent,
                                //elevation: 5,
                                style: TextStyle(color: Colors.black),

                                items: truyenDetail.chapters
                                    .map<DropdownMenuItem<ChapterModel>>(
                                        (ChapterModel value) {
                                  return DropdownMenuItem<ChapterModel>(
                                    value: value,
                                    child: Text(value.chapter),
                                  );
                                }).toList(),
                                // hint: Text(
                                //   'Chapter 1',
                                //   style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 13,
                                //       fontWeight: FontWeight.w600),
                                // ),
                                underline: Container(),
                                onChanged: (ChapterModel value) {
                                  onChangeChapterTruyen(value);
                                },
                              )))),
                      Expanded(
                        child: SizedBox(),
                        flex: 1,
                      ),
                      Expanded(
                          flex: 8,
                          child: FlatButton(
                              onPressed: () {
                                nextChapter('+');
                              },
                              child: Container(
                                height: 40,
                                child: Center(
                                    child: Text(
                                  'Chapter Sau',
                                  style: TextStyle(fontSize: 10),
                                )),
                              ),
                              color: Colors.green[800],
                              textColor: Colors.white))
                    ],
                  ))),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: DottedDecoration(
                    shape: Shape.box,
                    color: Colors.redAccent,
                  ),
                  child: Stack(
                    children: <Widget>[
                      WebView(
                        initialUrl: _chapterCurrent.urlChapter,
                        javascriptMode: JavascriptMode.unrestricted,
                        onPageFinished: (initialUrl) {
                          _myController.evaluateJavascript(js);
                          setState(() {
                            sleep(Duration(milliseconds: 500));
                            isLoading = false;
                          });
                        },
                        onWebViewCreated: (controller) {
                          _myController = controller;
                        },
                      ),
                      isLoading
                          ? Center(
                              child: Container(
                                child:
                                    Center(child: CircularProgressIndicator()),
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              ),
                            )
                          : Stack(),
                    ],
                  ),
                )),
            flex: 20,
          )
        ],
      )),
    );
  }
}
