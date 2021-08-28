import 'package:CoraEnglish/models/top_truyen_model.dart';
import 'package:CoraEnglish/models/truyen_model.dart';
import 'package:CoraEnglish/services/apiclient.dart';
import 'package:flutter/material.dart';
import 'item_truyen_doc_nhieu_widget.dart';

class TruyenDocNhieuWidget extends StatefulWidget {
  TruyenDocNhieuState createState() => TruyenDocNhieuState();
}

class TruyenDocNhieuState extends State {
  TopTruyenModel topTruyenSelected;
  List<TopTruyenModel> _topTruyenModels = [
    new TopTruyenModel(name: "Top Tháng", value: 11),
    new TopTruyenModel(name: "Top Tuần", value: 12),
    new TopTruyenModel(name: "Top Ngày", value: 13)
  ];

  bool isLoading = true;
  List<TruyenModel> lstTruyen = [];

  @override
  void initState() {
    super.initState();
    topTruyenSelected = _topTruyenModels[0];
    ApiClient().getTruyenWithType(topTruyenSelected.value, 1).then((value) {
      setState(() {
        isLoading = false;
        lstTruyen = value.data;
      });
    });
  }

  void onChangeDropdownTop(TopTruyenModel _truyenModel) {
    setState(() {
      isLoading = true;
    });
    ApiClient().getTruyenWithType(_truyenModel.value, 1).then((value) {
      setState(() {
        isLoading = false;
        lstTruyen = value.data;
      });
    });
  }

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
                  DropdownButton<TopTruyenModel>(
                    value: topTruyenSelected,
                    style: TextStyle(color: Colors.black),
                    items: _topTruyenModels
                        .map<DropdownMenuItem<TopTruyenModel>>(
                            (TopTruyenModel value) {
                      return DropdownMenuItem<TopTruyenModel>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                    hint: Text(
                      "Top Tháng",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (TopTruyenModel value) {
                      setState(() {
                        if (topTruyenSelected.value != value.value) {
                          topTruyenSelected = value;
                          onChangeDropdownTop(topTruyenSelected);
                        }
                      });
                    },
                  )
                ],
              )),
          Container(
            height: (70 * 7 + 2 * 7).toDouble(), //7 là số item mình set cứng
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.grey)),
            child: Center(
                child: !isLoading
                    ? ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 2,
                            color: Colors.grey,
                          );
                        },
                        itemCount: lstTruyen.length > 7 ? 7 : lstTruyen.length,
                        itemBuilder: (context, index) {
                          return ItemTruyenDocNhieuWidget(
                            index: index,
                            truyenModel: lstTruyen[index],
                          );
                        })
                    : CircularProgressIndicator()),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          )
        ],
      ),
    );
  }
}
