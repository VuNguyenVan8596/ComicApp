import 'package:CoraEnglish/models/truyen_model.dart';
import 'package:CoraEnglish/screens/truyen_detail_screen.dart';
import 'package:flutter/material.dart';

class ItemTruyenMoiCapNhatWidget extends StatelessWidget {
  final TruyenModel truyenModel;

  ItemTruyenMoiCapNhatWidget({this.truyenModel});

  List<Widget> renderChapterAndTimeOfTruyen(List<TruyenDetailMode> details) {
    List<Widget> rslt = [];
    int length = details.length > 3 ? 3 : details.length;
    for (int i = 0; i < length; i++) {
      rslt.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(details[i].chapter,
              style: TextStyle(fontSize: 11, color: Colors.black)),
          Text(details[i].timer,
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic))
        ],
      ));
    }
    return rslt;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(235, 235, 235, 1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.grey)),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TruyenDetailScreen()),
            );
          },
          child: Column(
            children: [
              Expanded(
                  flex: 6,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(truyenModel.urlImg),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                Text(
                                  truyenModel.view,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                Icon(
                                  Icons.message,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                Text(
                                  truyenModel.comment,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                Icon(Icons.hearing,
                                    color: Colors.white, size: 10),
                                Text(
                                  truyenModel.heart,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                          ))
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  softWrap: false,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  text: TextSpan(
                                      text: truyenModel.tenTruyen,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                )),
                            flex: 3,
                          ),
                          Expanded(
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: renderChapterAndTimeOfTruyen(
                                          truyenModel.details))),
                              flex: 6)
                        ],
                      )))
            ],
          ),
        ));
  }
}
