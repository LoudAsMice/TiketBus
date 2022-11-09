import 'package:flutter/material.dart';

class InformasiTiket extends StatefulWidget {
  const InformasiTiket({Key? key}) : super(key: key);

  @override
  State<InformasiTiket> createState() => _InformasiTiketState();
}

class _InformasiTiketState extends State<InformasiTiket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Informasi Tiket"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text("Jakarta -> Bandung Harga Rp.100.000,-",
                style: TextStyle(fontSize: 18)),
            Text("Jam Berangkat -> Jam 05:00, 05:30, 06:00, 10:00",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("Jakarta -> Jogja Harga Rp.350.000,-",
                style: TextStyle(fontSize: 18)),
            Text("Jam Berangkat -> Jam 05:30, 06:00, 06:30, 10:00",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("Jakarta -> Semarang Harga Rp.550.000,-",
                style: TextStyle(fontSize: 18)),
            Text("Jam Berangkat -> Jam 05:00, 05:30, 06:30, 10:00",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("Jakarta -> Surabaya Harga Rp.700.000,-",
                style: TextStyle(fontSize: 18)),
            Text("Jam Berangkat -> Jam 05:00, 05:30, 06:00, 10:00",
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
