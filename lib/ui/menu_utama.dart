import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokokita/bloc/logout_bloc.dart';
import 'package:tokokita/helpers/theme.dart';
import 'package:tokokita/helpers/user_info.dart';
import 'package:tokokita/model/login.dart';
import 'package:tokokita/ui/batal_pesan.dart';
import 'package:tokokita/ui/cetak_tiket.dart';
import 'package:tokokita/ui/informasi_tiket.dart';
import 'package:tokokita/ui/jadwal_pesan.dart';
import 'package:tokokita/ui/login_page.dart';
import 'package:tokokita/ui/status_bayar.dart';

class MenuUtama extends StatefulWidget {
  @override
  State<MenuUtama> createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Menu Utama"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.logout),
              onTap: () async {
                await LogoutBloc.logout().then((value) {
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (context) => LoginPage()));
                });
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buttonJadwal(),
                  SizedBox(height: 15),
                  _buttonBatal(),
                  SizedBox(height: 15),
                  _buttonStatus(),
                  SizedBox(height: 15),
                  _buttonBukti(),
                  SizedBox(height: 15),
                  _buttonInformasi()
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeManager>(context, listen: false).themeData =
              ThemeManager.isDark
                  ? ThemeManager.darkTheme
                  : ThemeManager.lightTheme;
          setState(() {
            ThemeManager.isDark = !ThemeManager.isDark;
          });
        },
        child: Icon(Icons.color_lens),
      ),
    );
  }

  Widget _buttonJadwal() {
    return SizedBox(
        width: 300,
        height: 40,
        child: ElevatedButton(
            child: Text("Cari Jadwal dan Pesan Tiket"),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => JadwalPesan()));
            }));
  }

  Widget _buttonBatal() {
    return SizedBox(
        width: 300,
        height: 40,
        child: ElevatedButton(
            child: Text("Batalkan Pemesanan"),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => BatalPesan()));
            }));
  }

  Widget _buttonStatus() {
    return SizedBox(
        width: 300,
        height: 40,
        child: ElevatedButton(
            child: Text("Cek Status Pembayaran"),
            onPressed: () {
              _statusbayar();
            }));
  }

  Widget _buttonBukti() {
    return SizedBox(
        width: 300,
        height: 40,
        child: ElevatedButton(
            child: Text("Bukti Pemesanan"),
            onPressed: () {
              _cetak();
            }));
  }

  Widget _buttonInformasi() {
    return SizedBox(
        width: 300,
        height: 40,
        child: ElevatedButton(
            child: Text("Informasi"),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => InformasiTiket()));
            }));
  }

  void _statusbayar() async {
    var id_user = await UserInfo().getUserID();
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => StatusBayar(iduser: id_user.toString())));
  }

  void _cetak() async {
    var id_user = await UserInfo().getUserID();
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => CetakTiket(id_user: id_user.toString())));
  }
}
