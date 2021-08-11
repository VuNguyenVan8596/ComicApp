import 'package:CoraEnglish/screens/truyen_detail_screen.dart';
import 'package:flutter/material.dart';

class ItemTruyenMoiCapNhatWidget extends StatelessWidget {
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
                              image: NetworkImage(
                                  'http://st.imageinstant.net/data/comics/46/sengoku-komachi-kurou-tan.jpg'),
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
                                  '486.000',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                Icon(
                                  Icons.message,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                Text(
                                  '486.000',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                Icon(Icons.hearing,
                                    color: Colors.white, size: 10),
                                Text(
                                  '486.000',
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            softWrap: false,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                            text: TextSpan(
                                text: 'Sengoku Komachi Kurou Tan!',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Chapter 123',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black)),
                              Text('3 Giờ trước',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Chapter 123',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black)),
                              Text('3 Giờ trước',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Chapter 123',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black)),
                              Text('3 Giờ trước',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic))
                            ],
                          )
                        ],
                      )))
            ],
          ),
        ));
  }
}
