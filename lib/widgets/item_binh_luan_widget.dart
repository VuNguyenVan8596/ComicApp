import 'package:CoraEnglish/models/chapter_binh_luan.dart';
import 'package:CoraEnglish/widgets/binh_luan_truyen_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ItemBinhLuanWidget extends StatefulWidget {
  final BinhLuan item;
  ItemBinhLuanWidget(this.item);
  ItemBinhLuanState createState() => ItemBinhLuanState(this.item);
}

class ItemBinhLuanState extends State {
  BinhLuan item;

  ItemBinhLuanState(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 150,
      //color: Colors.green,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(top: 5, right: 5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(item.urlAvatar),
                  backgroundColor: Colors.transparent,
                  radius: 28,
                )),
            flex: 2,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(216, 216, 216, 1)),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Row(
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 51, 255, 1),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 3, right: 3, top: 1, bottom: 1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Color.fromRGBO(32, 156, 238, 1))),
                            child: Center(
                              child: Text(
                                'Thành viên',
                                style: TextStyle(
                                    color: Color.fromRGBO(32, 156, 238, 1)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ReadMoreText(item.contentCmt,
                      textAlign: TextAlign.left,
                      trimLines: 5,
                      colorClickableText: Color.fromRGBO(153, 153, 153, 1),
                      trimCollapsedText: 'Xem thêm',
                      trimExpandedText: 'Thu gọn',
                      style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1))),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lock_clock,
                            color: Color.fromRGBO(153, 153, 153, 1),
                            size: 12,
                          ),
                          Text(
                            ' ${item.timeCmt}',
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                          child: Text("Thích",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15)),
                          onTap: () {
                            // do what you need to do when "Click here" gets clicked
                          }),
                      SizedBox(width: 10),
                      GestureDetector(
                          child: Text("Trả lời",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15)),
                          onTap: () {
                            BinhLuanTruyenState.levelReply = item.id;
                            BinhLuanTruyenState.txtNoiDung.text = item.name;
                            BinhLuanTruyenState.txtNoiDung.selection =
                                TextSelection.fromPosition(
                                    TextPosition(offset: item.name.length));
                          })
                    ],
                  )
                ],
              ),
            ),
            flex: 10,
          )
        ],
      ),
    );
  }
}
