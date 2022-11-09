class Tiketku {
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

  Tiketku(
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

  factory Tiketku.fromJson(Map<String?, dynamic> obj) {
    return Tiketku(
        id: obj['id'],
        id_user: obj['id_user'],
        id_tiketbus: obj['id_tiketbus'],
        nama: obj['nama'],
        hp: obj['hp'],
        jumlah: obj['jumlah'],
        asal: obj['asal'],
        tujuan: obj['tujuan'],
        tanggal: obj['tanggal'],
        jam: obj['jam'],
        satuan: obj['satuan'],
        total: obj['total'],
        status: obj['status']);
  }
}
