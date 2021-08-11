import 'package:CoraEnglish/widgets/item_truyen_moi_cap_nhat_widget.dart';
import 'package:flutter/material.dart';

class TruyenMoiCapNhatWidget extends StatefulWidget {
  TruyenMoiCapNhatState createState() => TruyenMoiCapNhatState();
}

class TruyenMoiCapNhatState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = (MediaQuery.of(context).size.width - 30) / 2;
    final itemHeight = (itemWidth * 4) / 3;

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
            height: itemHeight * 5 + 4 * 10,
            child: GridView.count(
                // shrinkWrap: true,
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
