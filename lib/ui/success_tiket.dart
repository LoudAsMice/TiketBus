import 'package:flutter/material.dart';
import 'package:tokokita/model/tiket.dart';
import 'package:tokokita/ui/menu_utama.dart';

class SuccessTiket extends StatefulWidget {
  Tiket? tiket;

  SuccessTiket({this.tiket});
  @override
  State<SuccessTiket> createState() => _SuccessTiketState();
}

class _SuccessTiketState extends State<SuccessTiket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Sukses"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Anda telah berhasil melakukan pemesanan tiket dengan Order ID = " +
                  widget.tiket!.id! +
                  ", atas nama = " +
                  widget.tiket!.nama! +
                  " . Silahkan melakukan pembayaran dengan cara mentransfer sebesar Rp." +
                  widget.tiket!.total! +
                  ",- ke nomor rekening BCA atas nama Muhamad Al Fadhil Satria, no rekening 4061478439 dengan menyebutkan ID pesanan. Anda memiliki waktu 2 hari untuk melakukan pembayaran, jika dalam dua hari tidak melakukan pembayaran maka pemesanan tiket akan otomatis dihapus. Terimakasih telah menggunakan layanan kami.",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buttonSelesai(),
    );
  }

  Widget _buttonSelesai() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        child: Text("Selesai"),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MenuUtama()),
              (route) => false);
        },
      ),
    );
  }
}
