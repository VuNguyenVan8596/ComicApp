import 'package:CoraEnglish/models/truyen_model.dart';
import 'package:CoraEnglish/screens/truyen_home_screen.dart';
import 'package:CoraEnglish/services/apiclient.dart';
import 'package:CoraEnglish/widgets/item_truyen_moi_cap_nhat_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DanhSachTruyenScreen extends StatefulWidget {
  final String title;
  final int type;
  DanhSachTruyenScreen({this.title, this.type});

  DanhSachTruyenState createState() =>
      DanhSachTruyenState(title: this.title, type: this.type);
}

class DanhSachTruyenState extends State {
  final String title;
  final int type;
  int page;
  ScrollController _scrollController;
  DanhSachTruyenState({this.title, this.type});

  List<TruyenModel> lstTruyen = [];
  bool isLoadding = true;
  bool isLoadmore = false;

  @override
  void initState() {
    super.initState();
    page = 1;

    _scrollController = new ScrollController()..addListener(_scrollListener);
    ApiClient().getTruyenWithType(type, page).then((value) {
      setState(() {
        isLoadding = false;
        lstTruyen = value.data;
      });
    });
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        if (!isLoadmore) {
          isLoadmore = true;
          page += 1;
          ApiClient().getTruyenWithType(type, page).then((value) {
            setState(() {
              lstTruyen.addAll(value.data);
              isLoadmore = false;
            });
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

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
            },
          )),
      body: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: !isLoadding
              ? Column(children: [
                  Expanded(
                      child: GridView.count(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3 / 4,
                          crossAxisCount: 2,
                          controller: _scrollController,
                          children: List.generate(lstTruyen.length, (index) {
                            return ItemTruyenMoiCapNhatWidget(
                                truyenModel: lstTruyen[index]);
                          })),
                      flex: 25),
                  isLoadmore
                      ? Expanded(
                          child: Container(
                            child: CircularProgressIndicator(),
                            height: 10.0,
                            width: 20.0,
                          ),
                          flex: 1)
                      : Container()
                ])
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
