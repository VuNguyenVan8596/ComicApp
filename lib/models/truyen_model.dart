class TruyenResponse {
  int errorCode;
  String errorMsg;
  List<TruyenModel> data;
  TruyenResponse({this.errorCode, this.errorMsg, this.data});

  factory TruyenResponse.fromJson(Map<String, dynamic> json) => TruyenResponse(
        errorCode: json["ErrorCode"],
        errorMsg: json["ErrorMsg"],
        data: List<TruyenModel>.from(
            json["Data"].map((x) => TruyenModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ErrorCode": errorCode,
        "ErrorMsg": errorMsg,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TruyenModel {
  String view;
  String heart;
  String comment;
  List<TruyenDetailMode> details;
  String urlTruyen;
  String urlImg;
  String tenTruyen;
  TruyenModel(
      {this.view,
      this.heart,
      this.comment,
      this.details,
      this.urlTruyen,
      this.urlImg,
      this.tenTruyen});

  factory TruyenModel.fromJson(Map<String, dynamic> json) => TruyenModel(
      view: json["view"],
      heart: json["heart"],
      comment: json["comment"],
      details: List<TruyenDetailMode>.from(
          json["details"].map((x) => TruyenDetailMode.fromJson(x))),
      urlTruyen: json["urlTruyen"],
      urlImg: json["urlImg"],
      tenTruyen: json["tenTruyen"]);

  Map<String, dynamic> toJson() => {
        "view": this.view,
        "heart": this.heart,
        "comment": comment,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
        "urlTruyen": urlTruyen,
        "urlImg": urlImg,
        "tenTruyen": tenTruyen
      };
}

class TruyenDetailMode {
  String chapter;
  String timer;

  TruyenDetailMode({this.chapter, this.timer});

  factory TruyenDetailMode.fromJson(Map<String, dynamic> json) =>
      TruyenDetailMode(chapter: json["chapter"], timer: json["timer"]);

  Map<String, dynamic> toJson() =>
      {"chapter": this.chapter, "timer": this.timer};
}
