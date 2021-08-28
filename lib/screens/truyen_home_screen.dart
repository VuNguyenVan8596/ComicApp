import 'package:CoraEnglish/models/menu.dart';
import 'package:CoraEnglish/screens/danh_sach_truyen_screen.dart';
import 'package:CoraEnglish/widgets/truyen_de_cu_widget.dart';
import 'package:CoraEnglish/widgets/truyen_doc_nhieu_widget.dart';
import 'package:CoraEnglish/widgets/truyen_moi_cap_nhat_widget.dart';
import 'package:flutter/material.dart';

class TruyenHomeScreen extends StatefulWidget {
  TruyenHomeState createState() => TruyenHomeState();
}

class TruyenHomeState extends State {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  ScrollController _scrollController = ScrollController();

  var menusApi = menus;

  TextEditingController textTimTruyenController = new TextEditingController();
  FocusNode focusNodeTextTimTruyen = FocusNode();

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
    focusNodeTextTimTruyen.dispose();
  }

  Future _scrollToTop() async {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lens Comic',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            key: _key,
            endDrawer: Drawer(
                child: Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.red,
                            child: DrawerHeader(
                                margin: EdgeInsets.only(bottom: 0),
                                decoration:
                                    BoxDecoration(color: Colors.purple[900]),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset('assets/logo-nettruyen.png',
                                          fit: BoxFit.cover),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        child: TextField(
                                          maxLines: 1,
                                          focusNode: focusNodeTextTimTruyen,
                                          style: TextStyle(color: Colors.white),
                                          controller: textTimTruyenController,
                                          decoration: InputDecoration.collapsed(
                                              hintText: "Tìm truyện ...",
                                              hintStyle: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey)),
                                      ),
                                      Container(
                                          width: 75,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Center(
                                                child: Text('TÌM'),
                                              )))
                                    ],
                                  ),
                                )),
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: Container(
                              color: Color.fromRGBO(51, 51, 51, 1),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  ListTile(
                                    title: Text('HOT',
                                        style: TextStyle(color: Colors.white)),
                                    onTap: () {
                                      // Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DanhSachTruyenScreen(
                                                  title: 'Truyện Hot',
                                                  type: 3,
                                                )),
                                      );
                                    },
                                  ),
                                  ListTile(
                                    title: Text('THEO DÕI',
                                        style: TextStyle(color: Colors.white)),
                                    onTap: () {
                                      // Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DanhSachTruyenScreen(
                                                    title:
                                                        'Truyện Đang Theo Dõi',
                                                    type: 3)),
                                      );
                                    },
                                  ),
                                  ListTile(
                                    title: Text('LỊCH SỬ',
                                        style: TextStyle(color: Colors.white)),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DanhSachTruyenScreen(
                                                    title: 'Truyện Đã Đọc',
                                                    type: 3)),
                                      );
                                    },
                                  ),
                                  ExpansionTile(
                                    collapsedIconColor: Colors.black,
                                    iconColor: Colors.black,
                                    title: Text("THỂ LOẠI",
                                        style: TextStyle(color: Colors.white)),
                                    children: <Widget>[
                                      ExpansionTile(
                                        collapsedIconColor: Colors.black,
                                        iconColor: Colors.black,
                                        title: Text("TẤT CẢ",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        children: [
                                          ListTile(
                                              title: Text("Adult",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                          ListTile(
                                              title: Text("Anime",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                          ListTile(
                                              title: Text("Comedy",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ],
                                      ),
                                      ExpansionTile(
                                          iconColor: Colors.black,
                                          collapsedIconColor: Colors.black,
                                          title: Text("ĐAM MỸ",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      ExpansionTile(
                                          iconColor: Colors.black,
                                          collapsedIconColor: Colors.black,
                                          title: Text("CỔ ĐẠI",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      ExpansionTile(
                                          iconColor: Colors.black,
                                          collapsedIconColor: Colors.black,
                                          title: Text("NGÔN TÌNH",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      ExpansionTile(
                                          iconColor: Colors.black,
                                          collapsedIconColor: Colors.black,
                                          title: Text("XUYÊN KHÔNG",
                                              style: TextStyle(
                                                  color: Colors.white)))
                                    ],
                                  ),
                                  ExpansionTile(
                                      collapsedIconColor: Colors.black,
                                      iconColor: Colors.black,
                                      title: Text("XẾP HẠNG",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      children: <Widget>[
                                        ListTile(
                                            title: Text("TOP THÁNG",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DanhSachTruyenScreen(
                                                            title: 'Top Tháng',
                                                            type: 11)),
                                              );
                                            }),
                                        ListTile(
                                            title: Text("TOP TUẦN",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DanhSachTruyenScreen(
                                                            title: 'Top Tuần',
                                                            type: 12)),
                                              );
                                            }),
                                        ListTile(
                                            title: Text("TOP NGÀY",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DanhSachTruyenScreen(
                                                            title: 'Top Ngày',
                                                            type: 13)),
                                              );
                                            })
                                      ]),
                                  ListTile(
                                    title: Text('CON GÁI',
                                        style: TextStyle(color: Colors.white)),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DanhSachTruyenScreen(
                                                    title: 'Truyện Con Gái',
                                                    type: 1)),
                                      );
                                    },
                                  ),
                                  ListTile(
                                    title: Text('CON TRAI',
                                        style: TextStyle(color: Colors.white)),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DanhSachTruyenScreen(
                                                  title: 'Truyện Con Trai',
                                                  type: 2,
                                                )),
                                      );
                                    },
                                  )
                                ],
                              )),
                          flex: 7,
                        ),
                        // ListView(
                        //   // Important: Remove any padding from the ListView.
                        //   padding: EdgeInsets.zero,
                        //   children: [
                        //     DrawerHeader(
                        //         decoration:
                        //             BoxDecoration(color: Colors.purple[900]),
                        //         child: Container(
                        //           child: Column(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceAround,
                        //             children: [
                        //               Image.asset('assets/logo-nettruyen.png',
                        //                   fit: BoxFit.cover),
                        //               Container(
                        //                 padding: EdgeInsets.all(5),
                        //                 child: TextField(
                        //                   maxLines: 1,
                        //                   focusNode: focusNodeTextTimTruyen,
                        //                   style: TextStyle(color: Colors.white),
                        //                   controller: textTimTruyenController,
                        //                   decoration: InputDecoration.collapsed(
                        //                       hintText: "Tìm truyện ...",
                        //                       hintStyle: TextStyle(
                        //                           color: Colors.white)),
                        //                 ),
                        //                 decoration: BoxDecoration(
                        //                     borderRadius:
                        //                         BorderRadius.circular(5),
                        //                     border:
                        //                         Border.all(color: Colors.grey)),
                        //               ),
                        //               Container(
                        //                   width: 75,
                        //                   height: 35,
                        //                   decoration: BoxDecoration(
                        //                       color: Colors.white,
                        //                       borderRadius:
                        //                           BorderRadius.circular(5)),
                        //                   child: TextButton(
                        //                       onPressed: () {},
                        //                       child: Center(
                        //                         child: Text('TÌM'),
                        //                       )))
                        //             ],
                        //           ),
                        //         )),
                        //     ListTile(
                        //       title: Text('HOT',
                        //           style: TextStyle(color: Colors.white)),
                        //       onTap: () {
                        //         Navigator.pop(context);
                        //         //Navigator.of(context).pop();
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   DanhSachTruyenScreen('Truyện Hot')),
                        //         );
                        //       },
                        //     ),
                        //     ListTile(
                        //       title: Text('THEO DÕI',
                        //           style: TextStyle(color: Colors.white)),
                        //       onTap: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   DanhSachTruyenScreen(
                        //                       'Truyện Đang Theo Dõi')),
                        //         );
                        //       },
                        //     ),
                        //     ListTile(
                        //       title: Text('LỊCH SỬ',
                        //           style: TextStyle(color: Colors.white)),
                        //       onTap: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   DanhSachTruyenScreen(
                        //                       'Truyện Đã Đọc')),
                        //         );
                        //       },
                        //     ),
                        //     ExpansionTile(
                        //       title: Text("THỂ LOẠI",
                        //           style: TextStyle(color: Colors.white)),
                        //       children: <Widget>[
                        //         ExpansionTile(
                        //           title: Text("TẤT CẢ",
                        //               style: TextStyle(color: Colors.white)),
                        //           children: [
                        //             ExpansionTile(
                        //                 title: Text("Adult",
                        //                     style: TextStyle(
                        //                         color: Colors.white))),
                        //             ExpansionTile(
                        //                 title: Text("Anime",
                        //                     style: TextStyle(
                        //                         color: Colors.white))),
                        //             ExpansionTile(
                        //                 title: Text("Comedy",
                        //                     style: TextStyle(
                        //                         color: Colors.white))),
                        //           ],
                        //         ),
                        //         ExpansionTile(
                        //             title: Text("ĐAM MỸ",
                        //                 style: TextStyle(color: Colors.white))),
                        //         ExpansionTile(
                        //             title: Text("CỔ ĐẠI",
                        //                 style: TextStyle(color: Colors.white))),
                        //         ExpansionTile(
                        //             title: Text("NGÔN TÌNH",
                        //                 style: TextStyle(color: Colors.white))),
                        //         ExpansionTile(
                        //             title: Text("XUYÊN KHÔNG",
                        //                 style: TextStyle(color: Colors.white)))
                        //       ],
                        //     ),
                        //     ListTile(
                        //       title: Text('XẾP HẠNG',
                        //           style: TextStyle(color: Colors.white)),
                        //       onTap: () {
                        //         // Update the state of the app.
                        //         // ...
                        //       },
                        //     ),
                        //     ListTile(
                        //       title: Text('CON GÁI',
                        //           style: TextStyle(color: Colors.white)),
                        //       onTap: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   DanhSachTruyenScreen(
                        //                       'Truyện Con Gái')),
                        //         );
                        //       },
                        //     ),
                        //     ListTile(
                        //       title: Text('CON TRAI',
                        //           style: TextStyle(color: Colors.white)),
                        //       onTap: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   DanhSachTruyenScreen(
                        //                       'Truyện Con Trai')),
                        //         );
                        //       },
                        //     )
                        //   ],
                        // )
                      ],
                    ))),
            appBar: AppBar(
              title:
                  Image.asset('assets/logo-nettruyen.png', fit: BoxFit.cover),
              centerTitle: false,
              backgroundColor: Colors.purple[900],
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _key.currentState.openEndDrawer();
                    focusNodeTextTimTruyen.requestFocus();
                  },
                ),
                IconButton(
                    onPressed: () {
                      _key.currentState.openEndDrawer();
                    },
                    icon: Icon(Icons.menu))
              ],
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: _scrollController,
                reverse: false,
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
                                  color: Colors.grey[400]?.withOpacity(1)),
                            )
                          ],
                        ))
                  ],
                ))));
  }
}
