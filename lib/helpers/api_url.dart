class ApiUrl {
  static const String baseUrl =
      'http://192.168.43.64/tiketbus/public/usercontroller';
  static const String tiketUrl =
      'http://192.168.43.64/tiketbus/public/tiketcontroller';

  static const String registrasi = baseUrl + '/register';
  static const String login = baseUrl + '/login';
  static const String cek = tiketUrl + '/cek';
  static const String pesan = tiketUrl + '/pesan';
  static const String tiketku = tiketUrl + '/tiketku';
  static const String cetak = tiketUrl + '/cetak';
  static const String cekTiket = tiketUrl + '/cektiket';
  static const String batal = tiketUrl + '/batal';
  static const String listProduk = baseUrl + '/produk';
  static const String createProduk = baseUrl + '/produk';

  static String updateProduk(int? id) {
    return baseUrl + '/produk/' + id.toString() + '/update';
  }

  static String showProduk(int? id) {
    return baseUrl + '/produk/' + id.toString();
  }

  static String deleteProduk(int? id) {
    return baseUrl + '/produk/' + id.toString();
  }
}
