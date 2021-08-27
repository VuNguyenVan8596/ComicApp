import 'dart:convert';

import 'package:CoraEnglish/models/truyen_de_cu_model.dart';
import 'package:CoraEnglish/models/truyen_model.dart';
import 'package:CoraEnglish/services/config.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<TruyenDeCuResponse> getTruyenDeCu() async {
    var client = http.Client();
    var url = Uri.parse(Config.urlBase + 'api/comic/decu');
    TruyenDeCuResponse truyenDeCuResponse = TruyenDeCuResponse(
        errorCode: Config.ErrorCodeCallAPIFail,
        errorMsg: Config.MsgCallAPIFail);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        truyenDeCuResponse = TruyenDeCuResponse.fromJson(jsonMap);
      }
    } catch (e) {}
    return truyenDeCuResponse;
  }

  Future<TruyenResponse> getTruyenMoiCapNhat() async {
    var client = http.Client();
    var url = Uri.parse(Config.urlBase + 'api/comic/moicapnhat');
    TruyenResponse truyenResponse = TruyenResponse(
        errorCode: Config.ErrorCodeCallAPIFail,
        errorMsg: Config.MsgCallAPIFail);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        truyenResponse = TruyenResponse.fromJson(jsonMap);
      }
    } catch (e) {}
    return truyenResponse;
  }

  Future<TruyenResponse> getTruyenWithType(int type, int page) async {
    var client = http.Client();
    var url = Uri.parse(Config.urlBase + 'api/comic/dstruyen/$type/$page');
    TruyenResponse truyenResponse = TruyenResponse(
        errorCode: Config.ErrorCodeCallAPIFail,
        errorMsg: Config.MsgCallAPIFail);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        truyenResponse = TruyenResponse.fromJson(jsonMap);
      }
    } catch (e) {}
    return truyenResponse;
  }
}
