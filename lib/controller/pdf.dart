import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class Pdf {
  static Future<File> generateCenteredText(
      String id,
      String nama,
      String asal,
      String tujuan,
      String tanggal,
      String jam,
      String satuan,
      String jumlah,
      String total,
      String status) async {
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          headLine(),
          Text('Order ID: ' + id),
          SizedBox(height: 5),
          Text('Atas nama: ' + nama),
          SizedBox(height: 5),
          Text('Kota asal: ' + asal),
          SizedBox(height: 5),
          Text('Kota tujuan: ' + tujuan),
          SizedBox(height: 5),
          Text('Tanggal: ' + tanggal),
          SizedBox(height: 5),
          Text('Jam berangkat: ' + jam),
          SizedBox(height: 5),
          Text('Harga: ' + satuan),
          SizedBox(height: 5),
          Text('Jumlah tiket: ' + jumlah),
          SizedBox(height: 5),
          Text('Total: Rp.' + total + ',-'),
          SizedBox(height: 10),
          Center(child: Text(status, style: TextStyle(fontSize: 20))),
          SizedBox(height: 50),
          footer()
        ],
      ),
    );
    return saveDocument(name: 'example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument(
      {required String name, required Document pdf}) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  static Widget headLine() => Header(
        child: Center(
          child: Text(
            'Tiket Bus',
            style: TextStyle(fontSize: 24, color: PdfColors.black),
          ),
        ),
      );

  static Widget footer() => Footer(
      trailing: Text("Powered by Muhamad Al Fadhil Satria",
          style: TextStyle(fontSize: 10)));
}
