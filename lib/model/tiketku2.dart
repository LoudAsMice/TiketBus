class Tiketku2 {
  String? id;
  String? id_user;
  String? id_tiketbus;
  String? nama;
  String? hp;
  String? jumlah;
  String? asal;
  String? tujuan;
  String? tanggal;
  String? jam;
  String? satuan;
  String? total;
  String? status;

  Tiketku2(
      {this.id,
      this.id_user,
      this.id_tiketbus,
      this.nama,
      this.hp,
      this.jumlah,
      this.asal,
      this.tujuan,
      this.tanggal,
      this.jam,
      this.satuan,
      this.total,
      this.status});

  factory Tiketku2.fromJson(Map<String?, dynamic> obj) {
    return Tiketku2(
        id: obj['data']['id'],
        id_user: obj['data']['id_user'],
        id_tiketbus: obj['data']['id_tiketbus'],
        nama: obj['data']['nama'],
        hp: obj['data']['hp'],
        jumlah: obj['data']['jumlah'],
        asal: obj['data']['asal'],
        tujuan: obj['data']['tujuan'],
        tanggal: obj['data']['tanggal'],
        jam: obj['data']['jam'],
        satuan: obj['data']['satuan'],
        total: obj['data']['total'],
        status: obj['data']['status']);
  }
}
