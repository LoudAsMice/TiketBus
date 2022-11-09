import 'package:flutter/material.dart';
import 'package:tokokita/bloc/tiketku_bloc.dart';

import 'package:tokokita/model/tiketku2.dart';
import 'package:tokokita/ui/menu_utama.dart';

class BatalKonfirmasi extends StatefulWidget {
  Tiketku2? tiketku;

  BatalKonfirmasi({this.tiketku});
  @override
  State<BatalKonfirmasi> createState() => _BatalKonfirmasiState();
}

class _BatalKonfirmasiState extends State<BatalKonfirmasi> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Data pembatalan tiket"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Order ID: ' + widget.tiketku!.id!,
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Text('Atas nama: ' + widget.tiketku!.nama!,
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Text('Kota asal: ' + widget.tiketku!.asal!,
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Text('Kota tujuan: ' + widget.tiketku!.tujuan!,
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Text('Tanggal: ' + widget.tiketku!.tanggal!,
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Text('Jam berangkat: ' + widget.tiketku!.jam! + ' WIB',
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Text('Total bayar: Rp.' + widget.tiketku!.total! + ',-',
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Text('Status: ' + widget.tiketku!.status!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text(
                "Anda yakin ingin membatalkan tiket?",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buttonYa(),
    );
  }

  Widget _buttonYa() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        child: Text("YA"),
        onPressed: () {
          _submit();
        },
      ),
    );
  }

  void _submit() {
    setState(() {
      _isLoading = true;
    });
    TiketkuBloc.batal(id: widget.tiketku!.id, nama: widget.tiketku!.nama).then(
        (value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MenuUtama()),
            (route) => false));
  }
}
