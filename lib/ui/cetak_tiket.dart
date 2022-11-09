import 'package:flutter/material.dart';
import 'package:tokokita/bloc/tiketku_bloc.dart';
import 'package:tokokita/model/tiketku.dart';
import 'package:tokokita/ui/detail_cetak.dart';

class CetakTiket extends StatefulWidget {
  String? id_user;

  CetakTiket({this.id_user});
  @override
  State<CetakTiket> createState() => _CetakTiketState();
}

class _CetakTiketState extends State<CetakTiket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Cetak Bukti Tiket"),
      ),
      body: FutureBuilder<List>(
        future: TiketkuBloc.cetak(id_user: widget.id_user),
        builder: (context, snapshot) {
          if (snapshot.hasError) ;
          return snapshot.hasData
              ? ListTiketku(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListTiketku extends StatelessWidget {
  final List? list;
  ListTiketku({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemTiketku(
            tiketku: list![i],
          );
        });
  }
}

class ItemTiketku extends StatelessWidget {
  final Tiketku? tiketku;

  ItemTiketku({this.tiketku});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => DetailCetak(tiketku: tiketku)),
          );
        },
        child: Card(
          child: ListTile(
            leading: Text(tiketku!.jam! + ' WIB'),
            title: Text(tiketku!.asal! + ' - ' + tiketku!.tujuan!),
            subtitle: Text(tiketku!.tanggal!),
            trailing: Text(tiketku!.status!),
          ),
        ),
      ),
    );
  }
}
