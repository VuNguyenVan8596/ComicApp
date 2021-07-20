import 'package:CoraEnglish/widgets/item_truyen_moi_cap_nhat_widget.dart';
import 'package:flutter/material.dart';

class TruyenMoiCapNhatWidget extends StatefulWidget {
  TruyenMoiCapNhatState createState() => TruyenMoiCapNhatState();
}

class TruyenMoiCapNhatState extends State {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            "TRUYỆN MỚI CẬP NHẬT",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(41, 128, 185, 1),
            ),
          ),
        ),
        Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10),
            // padding: EdgeInsets.only(top: 10, bottom: 10),
            height: 1220,
            decoration: BoxDecoration(
                //color: Colors.grey,
                ),
            child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
                crossAxisCount: 2,
                children: List.generate(10, (index) {
                  return ItemTruyenMoiCapNhatWidget();
                }))),
      ],
    );
  }
}
