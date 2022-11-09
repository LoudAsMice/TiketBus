import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:tokokita/controller/pdf.dart';
import 'package:tokokita/model/tiketku.dart';
import 'package:get/get.dart';

class DetailCetak extends StatefulWidget {
  Tiketku? tiketku;

  DetailCetak({this.tiketku});

  @override
  State<DetailCetak> createState() => _DetailCetakState();
}

class _DetailCetakState extends State<DetailCetak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Cetak Bukti Tiket"),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: _cetak(),
    );
  }

  Widget _cetak() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        child: Text("Cetak"),
        onPressed: () async {
          final pdfFile = await Pdf.generateCenteredText(
              widget.tiketku!.id!,
              widget.tiketku!.nama!,
              widget.tiketku!.asal!,
              widget.tiketku!.tujuan!,
              widget.tiketku!.tanggal!,
              widget.tiketku!.jam!,
              widget.tiketku!.satuan!,
              widget.tiketku!.jumlah!,
              widget.tiketku!.total!,
              widget.tiketku!.status!);

          Pdf.openFile(pdfFile);
        },
      ),
    );
  }

  Future<void> _createPDF() async {
    PdfDocument;
  }
}
