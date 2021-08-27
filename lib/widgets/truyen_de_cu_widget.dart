import 'dart:async';

import 'package:CoraEnglish/models/truyen_de_cu.dart';
import 'package:CoraEnglish/models/truyen_de_cu_model.dart';
import 'package:CoraEnglish/services/apiclient.dart';
import 'package:CoraEnglish/widgets/item_truyen_de_cu_widget.dart';
import 'package:flutter/material.dart';

class TruyenDeCuWidget extends StatefulWidget {
  @override
  TruyenDeCuState createState() => TruyenDeCuState();
}

class TruyenDeCuState extends State {
  final List<TruyenDeCu> lstTruyenDecu = fakeDatTruyenDeCu;
  final ScrollController _scrollController = ScrollController();

  Future<TruyenDeCuResponse> _truyenDeCuResponse;

  int item;
  double scrolAbleWidth;
  Timer timer;
  double widthScreen;
  @override
  void initState() {
    _truyenDeCuResponse = ApiClient().getTruyenDeCu();
    super.initState();
    item = 0;
  }

  void jumpToItem([String op = '', bool isAuto = true]) {
    if (op == '+') {
      if (item > lstTruyenDecu.length - 3) {
        item = 0;
      } else {
        item += 1;
      }
    } else {
      if (item <= 0) {
        item = 0;
      } else {
        item -= 1;
      }
    }

    double jum = item * (widthScreen * 0.94 / 2 + widthScreen * 0.01);

    _scrollController.animateTo(
      jum,
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    Timer.periodic(new Duration(seconds: 10), (timer) {
      jumpToItem('+');
    });
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(color: Colors.grey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                "TRUYỆN ĐỀ CỬ",
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(41, 128, 185, 1)),
              )),
          Expanded(
            child: Stack(
              children: [
                Center(
                    child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: FutureBuilder<TruyenDeCuResponse>(
                            future: _truyenDeCuResponse,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                    reverse: false,
                                    controller: _scrollController,
                                    physics: NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                      );
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder: (context, index) {
                                      return ItemTruyenDeCuWidget(
                                          snapshot.data.data[index]);
                                    });
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }))),
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.08,
                          height: MediaQuery.of(context).size.width * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3)),
                          child: Center(
                            child: Text('<',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.3))),
                          ),
                        ),
                        onTap: () {
                          jumpToItem('-', false);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.08,
                          height: MediaQuery.of(context).size.width * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3)),
                          child: Center(
                            child: Text('>',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.3))),
                          ),
                        ),
                        onTap: () {
                          jumpToItem('+', false);
                        },
                      )
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
