import 'dart:convert';

import 'package:tokokita/helpers/api.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/batal.dart';
import 'package:tokokita/model/tiketku.dart';
import 'package:tokokita/model/tiketku2.dart';

class TiketkuBloc {
  static Future<List<Tiketku>> tiketku({String? id_user}) async {
    String apiUrl = ApiUrl.tiketku;
    var body = {"id_user": id_user};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    List<dynamic> listTiketku = (jsonObj as Map<String, dynamic>)['data'];
    List<Tiketku> tiketku = [];
    for (int i = 0; i < listTiketku.length; i++) {
      tiketku.add(Tiketku.fromJson(listTiketku[i]));
    }
    return tiketku;
  }

  static Future<List<Tiketku>> cetak({String? id_user}) async {
    String apiUrl = ApiUrl.cetak;
    var body = {"id_user": id_user};
    var response = await Api().post(apiUrl, body);
    print(body);
    var jsonObj = json.decode(response.body);
    List<dynamic> listTiketku = (jsonObj as Map<String, dynamic>)['data'];
    List<Tiketku> tiketku = [];
    for (int i = 0; i < listTiketku.length; i++) {
      tiketku.add(Tiketku.fromJson(listTiketku[i]));
    }
    return tiketku;
  }

  static Future<Tiketku2> tiket({String? id, String? nama}) async {
    String apiUrl = ApiUrl.cekTiket;
    var body = {'id': id, 'nama': nama};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Tiketku2.fromJson(jsonObj);
  }

  static Future<Batal> batal({String? id, String? nama}) async {
    String apiUrl = ApiUrl.batal;
    var body = {'id': id, 'nama': nama};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Batal.fromJson(jsonObj);
  }
}
