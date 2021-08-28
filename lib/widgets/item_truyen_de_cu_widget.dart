import 'package:CoraEnglish/models/truyen_de_cu_model.dart';
import 'package:CoraEnglish/screens/truyen_detail_screen.dart';
import 'package:flutter/material.dart';

class ItemTruyenDeCuWidget extends StatelessWidget {
  final TruyenDeCuModel _truyenDeCu;
  ItemTruyenDeCuWidget(this._truyenDeCu);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.94 / 2,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.94 / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${_truyenDeCu.urlImg}'),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.94 / 2,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.7)),
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RichText(
                              softWrap: false,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                              text: TextSpan(
                                  text: '${_truyenDeCu.tenTruyen}',
                                  style: TextStyle(fontSize: 13)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('${_truyenDeCu.tapTruyen}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11)),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.timer,
                                          size: 13, color: Colors.white),
                                      Text(' ${_truyenDeCu.thoiGian}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11))
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                  ))
            ],
          ),
          decoration: BoxDecoration(color: Colors.blue)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TruyenDetailScreen(_truyenDeCu.urlTruyen)),
        );
      },
    );
  }
}
