// class BaseResponseModel<T> {
//   int errorCode;
//   String errorMsg;
//   T data;
//   BaseResponseModel({this.errorCode, this.errorMsg, this.data});

//   factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
//       BaseResponseModel(
//         errorCode: json["ErrorCode"],
//         errorMsg: json["ErrorMsg"],
//         data: T.from(json["Data"].map((x) => T.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "ErrorCode": errorCode,
//         "ErrorMsg": errorMsg,
//         "Data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }
