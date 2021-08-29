import 'dart:io';
import 'package:CoraEnglish/models/truyen_detail.dart';
import 'package:CoraEnglish/widgets/item_binh_luan_widget.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:CoraEnglish/models/chapter_binh_luan.dart';

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

  var blsChaCon = binhLuanConverts(binhLuanAll);

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
    if (op == '-') {
      //Thông báo là chưa có tập mới
      if (indexCurrent == 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Hiện chưa có chap mới."),
        ));
        return;
      }
      ChapterModel cp = truyenDetail.chapters.elementAt(indexCurrent + 1);
      onChangeChapterTruyen(cp);
      return;
    } else {
      if (indexCurrent == truyenDetail.chapters.length - 1) {
        return;
      }
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => BinhLuanTruyenWidget()),
                // );
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            AppBar().preferredSize.height -
                            25,
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        child: ListView.separated(
                          //controller: _scrollController,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (context, index) {
                            return blsChaCon[index].idParrent == 0
                                ? ItemBinhLuanWidget(blsChaCon[index])
                                : Row(children: [
                                    Expanded(
                                      child: Container(),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child:
                                          ItemBinhLuanWidget(blsChaCon[index]),
                                      flex: 10,
                                    )
                                  ]);
                          },
                          itemCount: blsChaCon.length,
                        ),
                      );
                    });
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
                                nextChapter('+');
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
                                nextChapter('-');
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
