import 'package:flutter/material.dart';

class TruyenDocNhieu {
  final int stt;
  final Color color;
  final String urlImage;
  final String name;
  final String chapter;
  final String viewer;
  TruyenDocNhieu(
      {@required this.stt,
      @required this.urlImage,
      @required this.name,
      @required this.chapter,
      @required this.viewer,
      @required this.color});
}

final lstTruyenDocNhieu = [
  TruyenDocNhieu(
      stt: 1,
      urlImage:
          'http://st.imageinstant.net/data/comics/32/vo-luyen-dinh-phong.jpg',
      name: 'Võ Luyện Đình Phong',
      chapter: 'Chapter 721',
      viewer: '22.000.000',
      color: Color.fromRGBO(52, 152, 219, 1)),
  TruyenDocNhieu(
      stt: 2,
      urlImage:
          'https://st.imageinstant.net/data/comics/213/trong-sinh-do-thi-tu-tien.jpg',
      name: 'Trọng Sinh Đô Thị Tu Tiên',
      chapter: 'Chapter 620',
      viewer: '18.987.000',
      color: Color.fromRGBO(39, 174, 96, 1)),
  TruyenDocNhieu(
      stt: 3,
      urlImage:
          'http://st.imageinstant.net/data/comics/127/toan-chuc-phap-su.jpg',
      name: 'Kịch Trường Của Takemichi',
      chapter: 'Chapter 214',
      viewer: '16.123.123',
      color: Color.fromRGBO(211, 84, 0, 1)),
  TruyenDocNhieu(
      stt: 4,
      urlImage:
          'http://st.imageinstant.net/data/comics/172/tren-nguoi-ta-co-mot-con-rong.jpg',
      name: 'Trên Người Ta Có Một Con Rồng',
      chapter: 'Chapter 378',
      viewer: '15.981.000',
      color: Colors.black),
  TruyenDocNhieu(
      stt: 5,
      urlImage:
          'http://st.imageinstant.net/data/comics/94/kich-truong-cua-takemichi.jpg',
      name: 'Toàn Chức Pháp Sư',
      chapter: 'Chapter 721',
      viewer: '12.000.000',
      color: Colors.black),
  TruyenDocNhieu(
      stt: 6,
      urlImage: 'http://st.imageinstant.net/data/comics/146/nguyen-ton.jpg',
      name: 'Nguyên Tôn',
      chapter: 'Chapter 332.5',
      viewer: '4.882.575',
      color: Colors.black),
  TruyenDocNhieu(
      stt: 7,
      urlImage:
          'http://st.imageinstant.net/data/comics/87/het-nhu-han-quang-gap-nang-gat.jpg',
      name: 'Hệt Như Hàn Quang Gặp Nắng Gắt',
      chapter: 'Chapter 193',
      viewer: '5.454.432',
      color: Colors.black)
];
