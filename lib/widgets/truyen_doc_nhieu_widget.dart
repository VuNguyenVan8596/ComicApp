import 'package:CoraEnglish/models/truyen_doc_nhieu.dart';
import 'package:flutter/material.dart';

import 'item_truyen_doc_nhieu_widget.dart';

class TruyenDocNhieuWidget extends StatefulWidget {
  TruyenDocNhieuState createState() => TruyenDocNhieuState();
}

class TruyenDocNhieuState extends State {
  String _chosenValue;
  List<TruyenDocNhieu> _list = lstTruyenDocNhieu;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TRUYỆN ĐỌC NHIỀU NHẤT",
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(41, 128, 185, 1)),
                  ),
                  DropdownButton<String>(
                    value: _chosenValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.black),

                    items: <String>['Top Tháng', 'Top Tuần', 'Top Ngày']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "Top Tháng",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                  )
                  // _tabSection(context)
                ],
              )),
          Container(
            height: (70 * _list.length + 2 * 7).toDouble(),
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.grey)),
            child: Center(
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 2,
                      color: Colors.grey,
                    );
                  },
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return ItemTruyenDocNhieuWidget(
                        truyenDocNhieu: _list[index], index: index);
                  }),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          )
        ],
      ),
    );
  }
}
