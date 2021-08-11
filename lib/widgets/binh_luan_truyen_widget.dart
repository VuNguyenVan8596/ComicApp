import 'package:CoraEnglish/models/chapter_binh_luan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'item_binh_luan_widget.dart';

class BinhLuanTruyenWidget extends StatefulWidget {
  BinhLuanTruyenState createState() => BinhLuanTruyenState();
}

class BinhLuanTruyenState extends State {
  double height_screen;
  var cmts = binhLuanAll;
  var blsChaCon = binhLuanConverts(binhLuanAll);
  ScrollController _scrollController = new ScrollController();
  static TextEditingController txtNoiDung = TextEditingController();
  static int levelReply;
  @override
  void initState() {
    super.initState();
    levelReply = 0;
  }

  // void setContentClickItemTraLoi(){
  //   txtNoiDung
  // }

  @override
  Widget build(BuildContext context) {
    height_screen = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        AppBar().preferredSize.height;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.purple[900],
          title: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(text: 'Bình Luận', style: TextStyle(fontSize: 16)),
            maxLines: 1,
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Container(
              //color: Colors.red,
              height: (height_screen / 10) * 8.5,
              padding: EdgeInsets.only(left: 5, right: 5, top: 5),
              child: ListView.separated(
                controller: _scrollController,
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
                            child: ItemBinhLuanWidget(blsChaCon[index]),
                            flex: 10,
                          )
                        ]);
                },
                itemCount: blsChaCon.length,
              ),
            ),
            Container(
              height: (height_screen / 10) * 1.5,
              padding: EdgeInsets.all(5),
              //color: Colors.blue,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          maxLines: 8,
                          controller: txtNoiDung,
                          decoration: InputDecoration.collapsed(
                              hintText: "Nhập nội dung ..."),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                      ),
                      flex: 6),
                  // Expanded(
                  //   child: SizedBox(),
                  //   flex: 1,
                  // ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                colors: <Color>[
                                  Color.fromRGBO(41, 143, 208, 1),
                                  Color.fromRGBO(0, 92, 178, 1)
                                ])),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              String bl = txtNoiDung.text;

                              if (levelReply != 0) {
                                int indexParent = blsChaCon.indexWhere(
                                    (element) => element.id == levelReply);
                                if (indexParent >= 0) {
                                  blsChaCon.insert(
                                      indexParent + 1,
                                      new BinhLuan(
                                          'http://st.imageinstant.net/data/sites/1/useravatars/635419.jpg?v=7526',
                                          'Hannabi',
                                          '2 Phút trước',
                                          bl,
                                          blsChaCon.length + 1,
                                          indexParent));
                                } else {
                                  blsChaCon.insert(
                                      0,
                                      new BinhLuan(
                                          'http://st.imageinstant.net/data/sites/1/useravatars/635419.jpg?v=7526',
                                          'Hannabi',
                                          '2 Phút trước',
                                          bl,
                                          blsChaCon.length + 1,
                                          0));
                                }
                              } else {
                                blsChaCon.insert(
                                    0,
                                    new BinhLuan(
                                        'http://st.imageinstant.net/data/sites/1/useravatars/635419.jpg?v=7526',
                                        'Hannabi',
                                        '2 Phút trước',
                                        bl,
                                        blsChaCon.length + 1,
                                        0));
                              }
                              levelReply = 0;
                              txtNoiDung.text = "";
                            });
                            // _scrollController.animateTo(
                            //   _scrollController.position.maxScrollExtent +
                            //       10000,
                            //   curve: Curves.easeOut,
                            //   duration: const Duration(milliseconds: 300),
                            // );
                          },
                          child: Center(
                            child: Text(
                              'Gửi',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    flex: 2,
                  )
                  // Expanded(
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Container(
                  //           height: 30,
                  //           padding: EdgeInsets.only(left: 3, right: 3),
                  //           child: Center(
                  //               child: TextField(
                  //             maxLines: 1,
                  //             decoration: InputDecoration.collapsed(
                  //                 hintText: "Tên (Bắt buộc)"),
                  //           )),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(5),
                  //               border: Border.all(color: Colors.grey)),
                  //         ),
                  //         flex: 10,
                  //       ),
                  //       Expanded(
                  //         child: SizedBox(),
                  //         flex: 1,
                  //       ),
                  //       Expanded(
                  //         child: Container(
                  //           height: 30,
                  //           padding: EdgeInsets.only(left: 3, right: 3),
                  //           child: Center(
                  //               child: Container(
                  //                   //height: double.infinity,
                  //                   //color: Colors.red,
                  //                   child: TextField(
                  //             textAlign: TextAlign.left,
                  //             maxLines: 1,
                  //             decoration: InputDecoration.collapsed(
                  //                 hintText: "Email (Không bắt buộc)"),
                  //           ))),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(5),
                  //               border: Border.all(color: Colors.grey)),
                  //         ),
                  //         flex: 10,
                  //       ),
                  //       Expanded(
                  //         child: SizedBox(),
                  //         flex: 1,
                  //       ),
                  //       Expanded(
                  //         child: Container(
                  //             height: 30,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(5),
                  //                 gradient: LinearGradient(
                  //                     begin: Alignment.topLeft,
                  //                     end: Alignment.bottomLeft,
                  //                     colors: <Color>[
                  //                       Color.fromRGBO(41, 143, 208, 1),
                  //                       Color.fromRGBO(0, 92, 178, 1)
                  //                     ])),
                  //             child: TextButton(
                  //               onPressed: () {
                  //                 setState(() {
                  //                   String bl = txtNoiDung.text;

                  //                   if (levelReply != 0) {
                  //                     int indexParent = blsChaCon.indexWhere(
                  //                         (element) =>
                  //                             element.id == levelReply);
                  //                     if (indexParent >= 0) {
                  //                       blsChaCon.insert(
                  //                           indexParent + 1,
                  //                           new BinhLuan(
                  //                               'http://st.imageinstant.net/data/sites/1/useravatars/635419.jpg?v=7526',
                  //                               'Hannabi',
                  //                               '2 Phút trước',
                  //                               bl,
                  //                               blsChaCon.length + 1,
                  //                               indexParent));
                  //                     } else {
                  //                       blsChaCon.add(new BinhLuan(
                  //                           'http://st.imageinstant.net/data/sites/1/useravatars/635419.jpg?v=7526',
                  //                           'Hannabi',
                  //                           '2 Phút trước',
                  //                           bl,
                  //                           blsChaCon.length + 1,
                  //                           0));
                  //                     }
                  //                   } else {
                  //                     blsChaCon.add(new BinhLuan(
                  //                         'http://st.imageinstant.net/data/sites/1/useravatars/635419.jpg?v=7526',
                  //                         'Hannabi',
                  //                         '2 Phút trước',
                  //                         bl,
                  //                         blsChaCon.length + 1,
                  //                         0));
                  //                   }
                  //                   levelReply = 0;
                  //                   txtNoiDung.text = "";
                  //                 });
                  //                 _scrollController.animateTo(
                  //                   _scrollController.position.maxScrollExtent +
                  //                       10000,
                  //                   curve: Curves.easeOut,
                  //                   duration: const Duration(milliseconds: 300),
                  //                 );
                  //               },
                  //               child: Center(
                  //                 child: Text(
                  //                   'Gửi',
                  //                   style: TextStyle(color: Colors.white),
                  //                 ),
                  //               ),
                  //             )),
                  //         flex: 5,
                  //       )
                  //     ],
                  //   ),
                  //   flex: 2,
                  // )
                ],
              ),
            )
          ],
        ))));
  }
}
