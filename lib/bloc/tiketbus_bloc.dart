import 'dart:convert';

import 'package:tokokita/helpers/api.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/tiketbus.dart';
import 'package:http/http.dart' as http;

class TiketbusBloc {
  static Future<List<Tiketbus>> tiketbus(
      {String? asal, String? tujuan, String? tanggal}) async {
    String apiUrl = ApiUrl.cek;
    var body = {"asal": asal, "tujuan": tujuan, "tanggal": tanggal};
    var response = await Api().post(apiUrl, body);
    // print(response.body);
    var jsonObj = json.decode(response.body);
    List<dynamic> listTiketbus = (jsonObj as Map<String, dynamic>)['data'];
    List<Tiketbus> tiketbus = [];
    for (int i = 0; i < listTiketbus.length; i++) {
      tiketbus.add(Tiketbus.fromJson(listTiketbus[i]));
    }
    return tiketbus;
  }
}
