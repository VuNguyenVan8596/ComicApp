class ChapterBinhLuan {
  int id;
  String urlAvatar;
  String name;
  String timeCmt;
  String contentCmt;
  ChapterBinhLuan(
      this.urlAvatar, this.name, this.timeCmt, this.contentCmt, this.id);
}

class BinhLuanTruyen {
  ChapterBinhLuan binhLuanCha;
  List<ChapterBinhLuan> binhLuanCons;
  BinhLuanTruyen(this.binhLuanCha, this.binhLuanCons);
}

class BinhLuan extends ChapterBinhLuan {
  int idParrent;
  BinhLuan(String urlAvatar, String name, String timeCmt, String contentCmt,
      int id, this.idParrent)
      : super(urlAvatar, name, timeCmt, contentCmt, id);
}

List<BinhLuan> binhLuanConverts(List<BinhLuanTruyen> binhLuanTruyen) {
  // ignore: deprecated_member_use
  var bls = new List<BinhLuan>();
  for (int i = 0; i <= binhLuanTruyen.length - 1; i++) {
    bls.add(new BinhLuan(
        binhLuanTruyen[i].binhLuanCha.urlAvatar,
        binhLuanTruyen[i].binhLuanCha.name,
        binhLuanTruyen[i].binhLuanCha.timeCmt,
        binhLuanTruyen[i].binhLuanCha.contentCmt,
        binhLuanTruyen[i].binhLuanCha.id,
        0));
    for (int j = 0; j <= binhLuanTruyen[i].binhLuanCons.length - 1; j++) {
      bls.add(new BinhLuan(
          binhLuanTruyen[i].binhLuanCons[j].urlAvatar,
          binhLuanTruyen[i].binhLuanCons[j].name,
          binhLuanTruyen[i].binhLuanCons[j].timeCmt,
          binhLuanTruyen[i].binhLuanCons[j].contentCmt,
          binhLuanTruyen[i].binhLuanCons[j].id,
          binhLuanTruyen[i].binhLuanCha.id));
    }
  }
  // for (int i = 0; i < bls.length; i++) {
  //   print(bls[i].);
  // }
  return bls;
}

var binhLuanAll = [
  new BinhLuanTruyen(
      new ChapterBinhLuan(
          'http://st.imageinstant.net/data/sites/1/useravatars/635419.jpg?v=7526',
          'Hannabi',
          '2 Phút trước',
          'Mn có biết truyện nào mà na9 RẤT hay ghen hông chỉ tui vớii :)',
          1),
      [
        new ChapterBinhLuan(
            'https://s.nettruyenvip.com/Data/SiteImages/anonymous.png',
            'Nguyễn Hiếu',
            '3 Phút trước',
            'OK nha',
            2),
        new ChapterBinhLuan(
            'https://s.nettruyenvip.com/Data/SiteImages/anonymous.png',
            'Nguyễn Hiếu',
            '3 Phút trước',
            'Tuyệt vời',
            3)
      ]),
  new BinhLuanTruyen(
      new ChapterBinhLuan(
          'https://s.nettruyenvip.com/Data/SiteImages/anonymous.png',
          'Nguyễn Hiếu',
          '3 Phút trước',
          'Bên Trung nhiều chap chưa dịch cho bạn nào  hóng nhé: https://s.𝘪d/an-hon-100-TQ. Qua thì cho mình xin 5s nhé ! Dành cho các bạn biết liên kết rút gọn vào như thế nào thôi nha !',
          4),
      []),
  new BinhLuanTruyen(
      new ChapterBinhLuan(
          'http://st.imageinstant.net/data/sites/1/useravatars/635419.jpg?v=7526',
          'Nola Trần',
          '4 Phút trước',
          'chị nhà người ta bị bắt cóc thì bị trói rồi khóc các thứ chờ banh nhà đến cứu,còn chị nhà tôi chả cần tự thu phục luôn cả 1 cái bang quá chất',
          5),
      []),
  new BinhLuanTruyen(
      new ChapterBinhLuan(
          'https://s.nettruyenvip.com/Data/SiteImages/anonymous.png',
          'Tìm Truyện',
          '5 Phút trước',
          'nu9 với na9 là bạn chơi với nhau từ nhỏ ( đã yêu nhau và hứa cưới nhau đủ kiểu ). Sau đó, gia đình nu9 thế nào đó mà phải chuyển đi nơi khác ở. Mấy năm sau nu9 quay về tìm na9 thì phát hiện na9 bị thương mất trí nhớ ( cụ thể là trước đó nu9 không nói cho na9 biết mình phải đi xa, khi na9 biết chuyện thì đuổi theo không may bị xe tông ). Na9 bây giờ là hs cá biệt + hotboy và đang crush nu8 ( bạch liên hoa ). Nu9 sau đó chuyển đến trường na9 và ngồi cùng bàn với na9. Nu9 luôn cố gợi lại kí ức cho na9 nhưng na9 chỉ thấy nu9 phiền nên nhiều lần sai đàn em đánh nu9. Nu8 còn nhiều lần hại nu9 khiến na9 ghét nu9 hơn. Sau này na9 tìm thấy trong nhà ảnh của na9 và nu9 hồi nhỏ nên bắt đầu chú ý đến nu9 ( nhưng vẫn crush nu8 ). Rồi trong một lần đi cắm trại leo núi các thứ với lớp thì na9 rơi xuống vực cùng nu9 và hồi phục lại kí ức nhưng lúc này nu9 đã chọn buông bỏ và đi theo na8. Sau đó na9 mặt dày đi cưa lại nu9. Này mình copy của bạn nào đó',
          6),
      [])
];

var chapterBinhLuans = [
  new ChapterBinhLuan(
      'http://st.imageinstant.net/data/sites/1/useravatars/635419.jpg?v=7526',
      'Hannabi',
      '2 Phút trước',
      'Mn có biết truyện nào mà na9 RẤT hay ghen hông chỉ tui vớii :)',
      1),
  new ChapterBinhLuan(
      'https://s.nettruyenvip.com/Data/SiteImages/anonymous.png',
      'Nguyễn Hiếu',
      '3 Phút trước',
      'Bên Trung nhiều chap chưa dịch cho bạn nào  hóng nhé: https://s.𝘪d/an-hon-100-TQ. Qua thì cho mình xin 5s nhé ! Dành cho các bạn biết liên kết rút gọn vào như thế nào thôi nha !',
      2),
  new ChapterBinhLuan(
      'http://st.imageinstant.net/data/sites/1/useravatars/635419.jpg?v=7526',
      'Nola Trần',
      '4 Phút trước',
      'chị nhà người ta bị bắt cóc thì bị trói rồi khóc các thứ chờ banh nhà đến cứu,còn chị nhà tôi chả cần tự thu phục luôn cả 1 cái bang quá chất',
      3),
  new ChapterBinhLuan(
      'https://s.nettruyenvip.com/Data/SiteImages/anonymous.png',
      'Tìm Truyện',
      '5 Phút trước',
      'nu9 với na9 là bạn chơi với nhau từ nhỏ ( đã yêu nhau và hứa cưới nhau đủ kiểu ). Sau đó, gia đình nu9 thế nào đó mà phải chuyển đi nơi khác ở. Mấy năm sau nu9 quay về tìm na9 thì phát hiện na9 bị thương mất trí nhớ ( cụ thể là trước đó nu9 không nói cho na9 biết mình phải đi xa, khi na9 biết chuyện thì đuổi theo không may bị xe tông ). Na9 bây giờ là hs cá biệt + hotboy và đang crush nu8 ( bạch liên hoa ). Nu9 sau đó chuyển đến trường na9 và ngồi cùng bàn với na9. Nu9 luôn cố gợi lại kí ức cho na9 nhưng na9 chỉ thấy nu9 phiền nên nhiều lần sai đàn em đánh nu9. Nu8 còn nhiều lần hại nu9 khiến na9 ghét nu9 hơn. Sau này na9 tìm thấy trong nhà ảnh của na9 và nu9 hồi nhỏ nên bắt đầu chú ý đến nu9 ( nhưng vẫn crush nu8 ). Rồi trong một lần đi cắm trại leo núi các thứ với lớp thì na9 rơi xuống vực cùng nu9 và hồi phục lại kí ức nhưng lúc này nu9 đã chọn buông bỏ và đi theo na8. Sau đó na9 mặt dày đi cưa lại nu9. Này mình copy của bạn nào đó',
      4),
];
