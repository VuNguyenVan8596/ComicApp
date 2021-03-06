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
                                              hintText: "T??m truy???n ...",
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
                                                child: Text('T??M'),
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
                                                  title: 'Truy???n Hot',
                                                  type: 3,
                                                )),
                                      );
                                    },
                                  ),
                                  ListTile(
                                    title: Text('THEO D??I',
                                        style: TextStyle(color: Colors.white)),
                                    onTap: () {
                                      // Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DanhSachTruyenScreen(
                                                    title:
                                                        'Truy???n ??ang Theo D??i',
                                                    type: 3)),
                                      );
                                    },
                                  ),
                                  ListTile(
                                    title: Text('L???CH S???',
                                        style: TextStyle(color: Colors.white)),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DanhSachTruyenScreen(
                                                    title: 'Truy???n ???? ?????c',
                                                    type: 3)),
                                      );
                                    },
                                  ),
                                  ExpansionTile(
                                    collapsedIconColor: Colors.black,
                                    iconColor: Colors.black,
                                    title: Text("TH??? LO???I",
                                        style: TextStyle(color: Colors.white)),
                                    children: <Widget>[
                                      ExpansionTile(
                                        collapsedIconColor: Colors.black,
                                        iconColor: Colors.black,
                                        title: Text("T???T C???",
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
                                          title: Text("??AM M???",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      ExpansionTile(
                                          iconColor: Colors.black,
                                          collapsedIconColor: Colors.black,
                                          title: Text("C??? ?????I",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      ExpansionTile(
                                          iconColor: Colors.black,
                                          collapsedIconColor: Colors.black,
                                          title: Text("NG??N T??NH",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      ExpansionTile(
                                          iconColor: Colors.black,
                                          collapsedIconColor: Colors.black,
                                          title: Text("XUY??N KH??NG",
                                              style: TextStyle(
                                                  color: Colors.white)))
                                    ],
                                  ),
                                  ExpansionTile(
                                      collapsedIconColor: Colors.black,
                                      iconColor: Colors.black,
                                      title: Text("X???P H???NG",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      children: <Widget>[
                                        ListTile(
                                            title: Text("TOP TH??NG",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DanhSachTruyenScreen(
                                                            title: 'Top Th??ng',
                                                            type: 11)),
                                              );
                                            }),
                                        ListTile(
                                            title: Text("TOP TU???N",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DanhSachTruyenScreen(
                                                            title: 'Top Tu???n',
                                                            type: 12)),
                                              );
                                            }),
                                        ListTile(
                                            title: Text("TOP NG??Y",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DanhSachTruyenScreen(
                                                            title: 'Top Ng??y',
                                                            type: 13)),
                                              );
                                            })
                                      ]),
                                  ListTile(
                                    title: Text('CON G??I',
                                        style: TextStyle(color: Colors.white)),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DanhSachTruyenScreen(
                                                    title: 'Truy???n Con G??i',
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
                                                  title: 'Truy???n Con Trai',
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
                        //                       hintText: "T??m truy???n ...",
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
                        //                         child: Text('T??M'),
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
                        //                   DanhSachTruyenScreen('Truy???n Hot')),
                        //         );
                        //       },
                        //     ),
                        //     ListTile(
                        //       title: Text('THEO D??I',
                        //           style: TextStyle(color: Colors.white)),
                        //       onTap: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   DanhSachTruyenScreen(
                        //                       'Truy???n ??ang Theo D??i')),
                        //         );
                        //       },
                        //     ),
                        //     ListTile(
                        //       title: Text('L???CH S???',
                        //           style: TextStyle(color: Colors.white)),
                        //       onTap: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   DanhSachTruyenScreen(
                        //                       'Truy???n ???? ?????c')),
                        //         );
                        //       },
                        //     ),
                        //     ExpansionTile(
                        //       title: Text("TH??? LO???I",
                        //           style: TextStyle(color: Colors.white)),
                        //       children: <Widget>[
                        //         ExpansionTile(
                        //           title: Text("T???T C???",
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
                        //             title: Text("??AM M???",
                        //                 style: TextStyle(color: Colors.white))),
                        //         ExpansionTile(
                        //             title: Text("C??? ?????I",
                        //                 style: TextStyle(color: Colors.white))),
                        //         ExpansionTile(
                        //             title: Text("NG??N T??NH",
                        //                 style: TextStyle(color: Colors.white))),
                        //         ExpansionTile(
                        //             title: Text("XUY??N KH??NG",
                        //                 style: TextStyle(color: Colors.white)))
                        //       ],
                        //     ),
                        //     ListTile(
                        //       title: Text('X???P H???NG',
                        //           style: TextStyle(color: Colors.white)),
                        //       onTap: () {
                        //         // Update the state of the app.
                        //         // ...
                        //       },
                        //     ),
                        //     ListTile(
                        //       title: Text('CON G??I',
                        //           style: TextStyle(color: Colors.white)),
                        //       onTap: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   DanhSachTruyenScreen(
                        //                       'Truy???n Con G??i')),
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
                        //                       'Truy???n Con Trai')),
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
                              '???? h???t n???i dung hi???n th???. B???m v??o ????? l??n ?????u trang.',
                              style: TextStyle(
                                  color: Colors.grey[400]?.withOpacity(1)),
                            )
                          ],
                        ))
                  ],
                ))));
  }
}
