import 'package:flutter/material.dart';
import 'package:tokokita/model/tiket.dart';
import 'package:tokokita/model/tiketku.dart';

class Detail extends StatefulWidget {
  Tiketku? tiketku;

  Detail({this.tiketku});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Detail"),
      ),
      body: Container(
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
              Text('Jumlah tiket: ' + widget.tiketku!.jumlah!,
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Text('Total bayar: Rp.' + widget.tiketku!.total! + ',-',
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Text('Status: ' + widget.tiketku!.status!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
