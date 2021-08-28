import 'package:CoraEnglish/models/chapter_truyen.dart';
import 'package:CoraEnglish/models/truyen_detail.dart';
import 'package:CoraEnglish/screens/truyen_main_screen.dart';
import 'package:CoraEnglish/services/apiclient.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TruyenDetailScreen extends StatefulWidget {
  final String urlTruyen;

  TruyenDetailScreen(this.urlTruyen);

  @override
  TruyenDetailState createState() => TruyenDetailState(this.urlTruyen);
}

class TruyenDetailState extends State {
  final ScrollController _scrollController = ScrollController();
  final String urlTruyen;

  TruyenDetailState(this.urlTruyen);

  Future<TruyenDetailResponse> _truyenDetailResponse;

  @override
  void initState() {
    super.initState();
    _truyenDetailResponse = ApiClient().getDetailTruyen(urlTruyen);
  }

  var chapterTruyens = chapterTruyes;
  Color colorFavorive = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.purple[900],
          title: Text('Thông tin truyện'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    colorFavorive = colorFavorive == Colors.pink
                        ? Colors.white
                        : Colors.pink;
                  });
                },
                icon: FaIcon(FontAwesomeIcons.heart, color: colorFavorive))
          ],
        ),
        body: FutureBuilder<TruyenDetailResponse>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 5),
                          child: Center(
                              child: Text(snapshot.data.data.tenTruyen,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))),
                        ),
                        Center(
                            child: Text(
                          snapshot.data.data.ngayCapNhat,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black45),
                        )),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(top: 1000),
                          width: MediaQuery.of(context).size.width * 0.5,
                          height:
                              (MediaQuery.of(context).size.width * 0.5) * 4 / 3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage(snapshot.data.data.urlImg),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          size: 15,
                                        ),
                                        Text(
                                          ' Tên Khác',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child:
                                        Text(snapshot.data.data.tenKhacTruyen))
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.autorenew,
                                          size: 15,
                                        ),
                                        Text(
                                          ' Tác giả',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Text(snapshot.data.data.tacGia))
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.tag_faces,
                                          size: 15,
                                        ),
                                        Text(
                                          ' Thể loại',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Text(snapshot.data.data.theLoai))
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.remove_red_eye,
                                          size: 15,
                                        ),
                                        Text(
                                          ' Lượt xem',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Text(snapshot.data.data.view))
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TruyenMainScreen(
                                                    indexCurrent: 0,
                                                    truyenDetail:
                                                        snapshot.data.data,
                                                  )),
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height: 40,
                                        child: Center(
                                            child: Text(
                                          'ĐỌC NGAY',
                                          style: TextStyle(fontSize: 16),
                                        )),
                                      ),
                                      color: Colors.green[800],
                                      textColor: Colors.white),
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TruyenMainScreen(
                                                    indexCurrent: 0,
                                                    truyenDetail:
                                                        snapshot.data.data,
                                                  )),
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height: 40,
                                        child: Center(
                                            child: Text(
                                          'ĐỌC TIẾP',
                                          style: TextStyle(fontSize: 16),
                                        )),
                                      ),
                                      color: Colors.green[800],
                                      textColor: Colors.white)
                                ])),
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.book,
                                color: Color.fromRGBO(41, 128, 185, 1),
                              ),
                              Text(
                                'NỘI DUNG',
                                style: TextStyle(
                                    fontSize: 18,
                                    //fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(41, 128, 185, 1)),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(41, 128, 185, 1)))),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              snapshot.data.data.noiDung,
                              style: TextStyle(fontSize: 16),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 10, top: 10),
                          height: 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.line_weight,
                                color: Color.fromRGBO(41, 128, 185, 1),
                              ),
                              Text(
                                'DANH SÁCH CHƯƠNG',
                                style: TextStyle(
                                    fontSize: 18,
                                    //fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(41, 128, 185, 1)),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(41, 128, 185, 1)))),
                        ),
                        Container(
                            //margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.9,
                            //height : chiều cao màn hình - khoảng trên app bar - chiều cao app bar - 30 (chiều cao của box nội dung)
                            height: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top -
                                40 -
                                AppBar().preferredSize.height,
                            child: Column(
                              children: [
                                Container(
                                    // decoration: DottedDecoration(
                                    //     shape: Shape.line, strokeWidth: 2),
                                    height: 20,
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text('Số Chương',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Center(
                                              child: Text('Cập Nhật',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          flex: 2,
                                        ),
                                        Expanded(
                                          child: Center(
                                              child: Text('Lượt Xem',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          flex: 2,
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    height: MediaQuery.of(context).size.height -
                                        MediaQuery.of(context).padding.top -
                                        40 -
                                        AppBar().preferredSize.height -
                                        30 -
                                        5,
                                    child: ListView.builder(
                                        controller: _scrollController,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            child: Container(
                                              decoration: DottedDecoration(
                                                shape: Shape.line,
                                              ),
                                              height: 40,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(snapshot
                                                        .data
                                                        .data
                                                        .chapters[index]
                                                        .chapter),
                                                    flex: 3,
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                        child: Text(
                                                            snapshot
                                                                .data
                                                                .data
                                                                .chapters[index]
                                                                .capNhat,
                                                            style: TextStyle(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        153,
                                                                        153,
                                                                        153,
                                                                        1)))),
                                                    flex: 2,
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                        child: Text(
                                                            snapshot
                                                                .data
                                                                .data
                                                                .chapters[index]
                                                                .view,
                                                            style: TextStyle(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        153,
                                                                        153,
                                                                        153,
                                                                        1)))),
                                                    flex: 2,
                                                  )
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TruyenMainScreen(
                                                          indexCurrent: index,
                                                          truyenDetail: snapshot
                                                              .data.data,
                                                        )),
                                              );
                                            },
                                          );
                                        },
                                        itemCount:
                                            snapshot.data.data.chapters.length))
                              ],
                            ))
                      ],
                    ));
              }
              return Center(child: CircularProgressIndicator());
            },
            future: _truyenDetailResponse));
  }
}
