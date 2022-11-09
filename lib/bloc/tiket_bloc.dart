import 'package:tokokita/helpers/api.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/tiket.dart';

import 'dart:convert';

class TiketBloc {
  static Future<Tiket> tiket(
      {String? id_user,
      String? id_tiketbus,
      String? nama,
      String? hp,
      String? jumlah,
      String? asal,
      String? tujuan,
      String? tanggal,
      String? jam,
      String? satuan,
      String? total}) async {
    String apiUrl = ApiUrl.pesan;
    var body = {
      "id_user": id_user,
      "id_tiketbus": id_tiketbus,
      "nama": nama,
      "hp": hp,
      "jumlah": jumlah,
      "asal": asal,
      "tujuan": tujuan,
      "tanggal": tanggal,
      "jam": jam,
      "satuan": satuan,
      "total": total
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Tiket.fromJson(jsonObj);
  }
}
