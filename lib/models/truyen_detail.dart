class TruyenDetailResponse {
  int errorCode;
  String errorMsg;
  TruyenDetail data;
  TruyenDetailResponse({this.errorCode, this.errorMsg, this.data});

  factory TruyenDetailResponse.fromJson(Map<String, dynamic> json) =>
      TruyenDetailResponse(
        errorCode: json["ErrorCode"],
        errorMsg: json["ErrorMsg"],
        data: TruyenDetail.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "ErrorCode": errorCode,
        "ErrorMsg": errorMsg,
        "Data": data.toJson(),
      };
}

class TruyenDetail {
  String tenTruyen;
  String ngayCapNhat;
  String urlImg;
  String tenKhacTruyen;
  String tacGia;
  String theLoai;
  String view;
  String noiDung;
  List<ChapterModel> chapters;
  TruyenDetail(
      {this.tenTruyen,
      this.ngayCapNhat,
      this.urlImg,
      this.tenKhacTruyen,
      this.tacGia,
      this.theLoai,
      this.view,
      this.noiDung,
      this.chapters});

  factory TruyenDetail.fromJson(Map<String, dynamic> json) => TruyenDetail(
      tenTruyen: json["tenTruyen"],
      ngayCapNhat: json["ngayCapNhat"],
      urlImg: json["urlImg"],
      tenKhacTruyen: json["tenKhacTruyen"],
      tacGia: json["tacGia"],
      theLoai: json["theLoai"],
      view: json["view"],
      noiDung: json["noiDung"],
      chapters: List<ChapterModel>.from(
          json["chapters"].map((x) => ChapterModel.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "tenTruyen": this.tenTruyen,
        "ngayCapNhat": this.ngayCapNhat,
        "urlImg": this.urlImg,
        "tenKhacTruyen": this.tenKhacTruyen,
        "tacGia": this.tacGia,
        "theLoai": this.theLoai,
        "view": this.view,
        "noiDung": this.noiDung,
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson()))
      };
}

class ChapterModel {
  String chapter;
  String capNhat;
  String view;
  String urlChapter;

  ChapterModel({this.chapter, this.capNhat, this.view, this.urlChapter});

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
      chapter: json["chapter"],
      capNhat: json["capNhat"],
      view: json["view"],
      urlChapter: json["urlChapter"]);

  Map<String, dynamic> toJson() => {
        "chapter": this.chapter,
        "capNhat": this.capNhat,
        "view": this.view,
        "urlChapter": this.urlChapter
      };
}
