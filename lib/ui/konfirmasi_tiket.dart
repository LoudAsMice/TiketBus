import 'package:flutter/material.dart';
import 'package:tokokita/bloc/tiket_bloc.dart';
import 'package:tokokita/helpers/user_info.dart';
import 'package:tokokita/model/tiket.dart';
import 'package:tokokita/model/tiketbus.dart';
import 'package:tokokita/ui/success_tiket.dart';

class KonfirmasiTiket extends StatefulWidget {
  Tiketbus? tiketbus;
  String? hp;
  String? nama;
  int? jumlah;

  KonfirmasiTiket({this.tiketbus, this.nama, this.hp, this.jumlah});

  @override
  State<KonfirmasiTiket> createState() => _KonfirmasiTiketState();
}

class _KonfirmasiTiketState extends State<KonfirmasiTiket> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Konfirmasi Tiket"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Atas nama: " + widget.nama!, style: TextStyle(fontSize: 20)),
            Text("No. Telp/HP: " + widget.hp!.toString(),
                style: TextStyle(fontSize: 20)),
            Text("Jumlah Tiket: " + widget.jumlah.toString(),
                style: TextStyle(fontSize: 20)),
            Text("Kota Asal: " + widget.tiketbus!.asal!,
                style: TextStyle(fontSize: 20)),
            Text("Kota Tujuan: " + widget.tiketbus!.tujuan!,
                style: TextStyle(fontSize: 20)),
            Text("Tanggal: " + widget.tiketbus!.tanggal!,
                style: TextStyle(fontSize: 20)),
            Text("Total Bayar: Rp." + _total() + ',-',
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      bottomNavigationBar: _buttonKonfirmasi(),
    );
  }

  _total() {
    int hasil = int.parse(widget.tiketbus!.harga!) * widget.jumlah!;
    return hasil.toString();
  }

  Widget _buttonKonfirmasi() {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        child: Text("Konfirmasi"),
        onPressed: () {
          if (!_isLoading) {
            _konfirmasi();
          }
        },
      ),
    );
  }

  void _konfirmasi() async {
    var id_user = await UserInfo().getUserID();
    setState(() {
      _isLoading = true;
    });
    TiketBloc.tiket(
            id_user: id_user.toString(),
            id_tiketbus: widget.tiketbus!.id!,
            nama: widget.nama,
            hp: widget.hp.toString(),
            jumlah: widget.jumlah.toString(),
            asal: widget.tiketbus!.asal,
            tujuan: widget.tiketbus!.tujuan,
            tanggal: widget.tiketbus!.tanggal,
            jam: widget.tiketbus!.jam,
            satuan: widget.tiketbus!.harga!,
            total: _total())
        .then((value) async {
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (context) => SuccessTiket(tiket: value)));
    });
  }
}
