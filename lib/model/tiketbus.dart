class Tiketbus {
  String? id;
  String? asal;
  String? tujuan;
  String? tanggal;
  String? jam;
  String? harga;
  String? tersedia;

  Tiketbus(
      {this.id,
      this.asal,
      this.tujuan,
      this.tanggal,
      this.jam,
      this.harga,
      this.tersedia});

  factory Tiketbus.fromJson(Map<String?, dynamic> obj) {
    return Tiketbus(
      id: obj['id'],
      asal: obj['asal'],
      tujuan: obj['tujuan'],
      tanggal: obj['tanggal'],
      jam: obj['jam'],
      harga: obj['harga'],
      tersedia: obj['tersedia'],
    );
  }
}
