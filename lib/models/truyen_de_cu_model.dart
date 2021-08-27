class TruyenDeCuResponse {
  int errorCode;
  String errorMsg;
  List<TruyenDeCuModel> data;
  TruyenDeCuResponse({this.errorCode, this.errorMsg, this.data});

  factory TruyenDeCuResponse.fromJson(Map<String, dynamic> json) =>
      TruyenDeCuResponse(
        errorCode: json["ErrorCode"],
        errorMsg: json["ErrorMsg"],
        data: List<TruyenDeCuModel>.from(
            json["Data"].map((x) => TruyenDeCuModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ErrorCode": errorCode,
        "ErrorMsg": errorMsg,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TruyenDeCuModel {
  String urlTruyen;
  String urlImg;
  String tenTruyen;
  String tapTruyen;
  String thoiGian;

  TruyenDeCuModel(
      {this.urlTruyen,
      this.urlImg,
      this.tenTruyen,
      this.tapTruyen,
      this.thoiGian});

  factory TruyenDeCuModel.fromJson(Map<String, dynamic> json) =>
      TruyenDeCuModel(
          urlTruyen: json["urlTruyen"],
          urlImg: json["urlImg"],
          tenTruyen: json["tenTruyen"],
          tapTruyen: json["tapTruyen"],
          thoiGian: json["thoiGian"]);

  Map<String, dynamic> toJson() => {
        "urlTruyen": this.urlTruyen,
        "urlImg": this.urlImg,
        "tenTruyen": this.tenTruyen,
        "tapTruyen": this.tapTruyen,
        "thoiGian": this.thoiGian
      };
}
