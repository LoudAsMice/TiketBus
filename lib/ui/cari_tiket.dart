import 'package:flutter/material.dart';
import 'package:tokokita/bloc/tiketbus_bloc.dart';
import 'package:tokokita/model/tiketbus.dart';
import 'package:tokokita/ui/detail_tiket.dart';

class CariTiket extends StatefulWidget {
  final String? asal;
  final String? tujuan;
  final String? tanggal;

  CariTiket({Key? key, @required this.asal, this.tujuan, this.tanggal})
      : super(key: key);
  @override
  _CariTiketState createState() => _CariTiketState(asal, tujuan, tanggal);
}

class _CariTiketState extends State<CariTiket> {
  String? asal;
  String? tujuan;
  String? tanggal;
  _CariTiketState(this.asal, this.tujuan, this.tanggal);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Jadwal"),
      ),
      body: FutureBuilder<List>(
        future:
            TiketbusBloc.tiketbus(asal: asal, tujuan: tujuan, tanggal: tanggal),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {}
          ;
          return snapshot.hasData
              ? ListTiketbus(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListTiketbus extends StatelessWidget {
  final List? list;
  ListTiketbus({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemTiketbus(
            tiketbus: list![i],
          );
        });
  }
}

class ItemTiketbus extends StatelessWidget {
  final Tiketbus? tiketbus;

  ItemTiketbus({this.tiketbus});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => DetailTiket(tiketbus: tiketbus)),
          );
        },
        child: Card(
          child: ListTile(
            leading: Text(tiketbus!.jam! + ' WIB'),
            title: Text(tiketbus!.asal! + ' - ' + tiketbus!.tujuan!),
            subtitle: Text('Rp. ' + tiketbus!.harga!.toString() + ',-'),
            trailing: Text(tiketbus!.tersedia! + ' Left'),
          ),
        ),
      ),
    );
  }
}
