import 'package:flutter/material.dart';
import 'package:tokokita/model/tiketbus.dart';
import 'package:tokokita/ui/pesan_tiket.dart';

class DetailTiket extends StatefulWidget {
  Tiketbus? tiketbus;

  DetailTiket({this.tiketbus});
  @override
  State<DetailTiket> createState() => _DetailTiketState();
}

class _DetailTiketState extends State<DetailTiket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Detail Tiket"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Data ditemukan dengan id: ' + widget.tiketbus!.id!,
                  style: TextStyle(fontSize: 20)),
              Text('Kota asal: ' + widget.tiketbus!.asal!,
                  style: TextStyle(fontSize: 20)),
              Text('Kota tujuan: ' + widget.tiketbus!.tujuan!,
                  style: TextStyle(fontSize: 20)),
              Text('Tanggal: ' + widget.tiketbus!.tanggal!,
                  style: TextStyle(fontSize: 20)),
              Text('Jam berangkat: ' + widget.tiketbus!.jam! + ' WIB',
                  style: TextStyle(fontSize: 20)),
              Text('Harga: Rp.' + widget.tiketbus!.harga! + ',-',
                  style: TextStyle(fontSize: 20)),
              Text('Seat yang tersedia: ' + widget.tiketbus!.tersedia!,
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buttonPesan(),
    );
  }

  Widget _buttonPesan() {
    return SizedBox(
      height: 50.0,
      child: ElevatedButton(
        child: Text("Pesan"),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => PesanTiket(tiketbus: widget.tiketbus),
            ),
          );
        },
      ),
    );
  }
}
