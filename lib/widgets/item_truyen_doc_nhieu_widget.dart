import 'package:CoraEnglish/models/truyen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTruyenDocNhieuWidget extends StatelessWidget {
  final TruyenModel truyenModel;
  final int index;
  ItemTruyenDocNhieuWidget({this.index, this.truyenModel});

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
                  '0' + (index + 1).toString(),
                  style: TextStyle(
                      color: index == 0
                          ? Color.fromRGBO(52, 152, 219, 1)
                          : (index == 1
                              ? Color.fromRGBO(39, 174, 96, 1)
                              : (index == 2
                                  ? Color.fromRGBO(211, 84, 0, 1)
                                  : Colors.black)),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))),
            Expanded(
              flex: 3,
              child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(truyenModel.urlImg),
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
                              text: truyenModel.tenTruyen,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(truyenModel.details.last.chapter),
                            Row(
                              children: [
                                Icon(Icons.remove_red_eye,
                                    size: 13, color: Colors.black),
                                Text(' ' + truyenModel.view,
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
