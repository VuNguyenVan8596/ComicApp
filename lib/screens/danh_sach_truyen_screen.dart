import 'package:CoraEnglish/screens/truyen_home_screen.dart';
import 'package:CoraEnglish/widgets/item_truyen_moi_cap_nhat_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DanhSachTruyenScreen extends StatelessWidget {
  final String title;
  DanhSachTruyenScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(this.title.toUpperCase()),
          backgroundColor: Colors.purple[900],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => {
              Navigator.pop(context),
              //Navigator.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TruyenHomeScreen()),
              )
              // Navigator.pushNamedAndRemoveUntil(
              //     context, "/newRouteName", (r) => false)
            },
          )),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
            // shrinkWrap: true,
            //physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
            crossAxisCount: 2,
            children: List.generate(30, (index) {
              return ItemTruyenMoiCapNhatWidget();
            })),
      ),
    );
  }
}
