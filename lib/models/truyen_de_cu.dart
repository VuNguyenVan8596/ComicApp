import 'package:flutter/cupertino.dart';

class TruyenDeCu {
  final String urlImage;
  final String name;
  final String chapter;
  final String timePublish;
  TruyenDeCu(
      {@required this.urlImage,
      @required this.name,
      @required this.chapter,
      @required this.timePublish});
}

List<TruyenDeCu> fakeDatTruyenDeCu = [
  TruyenDeCu(
      urlImage:
          'http://st.imageinstant.net/data/comics/182/co-vo-hop-dong-bo-tron-cua-tong-giam-doc-2344.jpg',
      name: 'Cô Vợ Hợp Đồng Bỏ Trốn Của Tổng Giám Đốc',
      chapter: 'Chapter 354.2',
      timePublish: '1 ngày trước'),
  TruyenDeCu(
      urlImage:
          'http://st.imageinstant.net/data/comics/113/mairimashita-iruma-kun.jpg',
      name: 'Mairimashita! Iruma-kun',
      chapter: 'Chapter 212',
      timePublish: '2 ngày trước'),
  TruyenDeCu(
      urlImage:
          'http://st.imageinstant.net/data/comics/182/co-vo-hop-dong-bo-tron-cua-tong-giam-doc-2344.jpg',
      name: 'Cô Vợ Hợp Đồng Bỏ Trốn Của Tổng Giám Đốc',
      chapter: 'Chapter 354.2',
      timePublish: '1 ngày trước'),
  TruyenDeCu(
      urlImage:
          'http://st.imageinstant.net/data/comics/94/kich-truong-cua-takemichi.jpg',
      name: 'Kịch Trường Của Takemichi',
      chapter: 'Chapter 214',
      timePublish: '4 ngày trước'),
  TruyenDeCu(
      urlImage:
          'http://st.imageinstant.net/data/comics/182/co-vo-hop-dong-bo-tron-cua-tong-giam-doc-2344.jpg',
      name: 'Cô Vợ Hợp Đồng Bỏ Trốn Của Tổng Giám Đốc',
      chapter: 'Chapter 354.2',
      timePublish: '1 ngày trước'),
  TruyenDeCu(
      urlImage:
          'http://st.imageinstant.net/data/comics/26/quan-chua-vung-vang-thiet-lap-nhan-vat-k-1584.jpg',
      name: 'Quận Chúa Vững Vàng, Thiết Lập Nhân Vật Không Thể Vỡ',
      chapter: 'Chapter 60',
      timePublish: '05:41 20/05')
  //,
  // TruyenDeCu(
  //     urlImage:
  //         'http://st.imageinstant.net/data/comics/182/co-vo-hop-dong-bo-tron-cua-tong-giam-doc-2344.jpg',
  //     name: 'Cô Vợ Hợp Đồng Bỏ Trốn Của Tổng Giám Đốc',
  //     chapter: 'Chapter 354.2',
  //     timePublish: '1 ngày trước')
];
