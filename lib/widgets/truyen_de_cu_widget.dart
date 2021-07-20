import 'dart:async';

import 'package:CoraEnglish/models/truyen_de_cu.dart';
import 'package:CoraEnglish/widgets/item_truyen_de_cu_widget.dart';
import 'package:flutter/material.dart';

class TruyenDeCuWidget extends StatefulWidget {
  @override
  TruyenDeCuState createState() => TruyenDeCuState();
}

class TruyenDeCuState extends State {
  final List<TruyenDeCu> lstTruyenDecu = fakeDatTruyenDeCu;
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 1000);
  int item;
  double scrolAbleWidth;
  Timer timer;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      jumpToItem('+');
    });
  }

  cancelTimer() {
    timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    item = 0;
    scrolAbleWidth = -1000;
  }

  void jumpToItem([String op, bool isAuto = true]) {
    if (!isAuto) {
      cancelTimer();
    }

    if (this.scrolAbleWidth == -1000) //chưa dược init
    {
      this.scrolAbleWidth =
          (context.size.width * 0.94 / 2 + context.size.width * 0.01) *
              (lstTruyenDecu.length - 2);
    }
    // print(lstTruyenDecu.length);
    // print(item);
    if (op == '+') {
      if (item > lstTruyenDecu.length - 1) {
        setState(() {
          item = 0;
        });
      } else {
        setState(() {
          item += 1;
        });
      }
    } else {
      if (item <= 0) {
        setState(() {
          item = 0;
        });
      } else {
        setState(() {
          item -= 1;
        });
      }
    }

    double jum = this.scrolAbleWidth -
        item * (context.size.width * 0.94 / 2 + context.size.width * 0.01);

    _scrollController.animateTo(
      jum,
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 500),
    );

    if (!timer.isActive) {
      Future.delayed(Duration(seconds: 1), () => startTimer());
    }
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
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
                        child: ListView.separated(
                            reverse: true,
                            controller: _scrollController,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: lstTruyenDecu.length,
                            itemBuilder: (context, index) {
                              return ItemTruyenDeCuWidget(lstTruyenDecu[index]);
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
