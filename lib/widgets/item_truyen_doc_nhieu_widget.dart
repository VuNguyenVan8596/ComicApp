import 'package:CoraEnglish/models/truyen_doc_nhieu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTruyenDocNhieuWidget extends StatelessWidget {
  final TruyenDocNhieu truyenDocNhieu;
  final int index;
  ItemTruyenDocNhieuWidget({this.truyenDocNhieu, this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        height: 70,
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  '0' + truyenDocNhieu.stt.toString(),
                  style: TextStyle(
                      color: truyenDocNhieu.color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))),
            Expanded(
              flex: 3,
              child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(truyenDocNhieu.urlImage),
                          fit: BoxFit.cover))),
            ),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          softWrap: false,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                          text: TextSpan(
                              text: truyenDocNhieu.name,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(truyenDocNhieu.chapter),
                            Row(
                              children: [
                                Icon(Icons.remove_red_eye,
                                    size: 13, color: Colors.black),
                                Text(' ' + truyenDocNhieu.viewer,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontStyle: FontStyle.italic))
                              ],
                            )
                          ],
                        )
                      ],
                    )))
          ],
        ));
  }
}
