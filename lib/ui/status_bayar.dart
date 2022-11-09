import 'package:flutter/material.dart';
import 'package:tokokita/bloc/tiketku_bloc.dart';
import 'package:tokokita/helpers/user_info.dart';
import 'package:tokokita/model/tiketku.dart';
import 'package:tokokita/ui/detail.dart';

class StatusBayar extends StatefulWidget {
  String? iduser;

  StatusBayar({this.iduser});

  @override
  State<StatusBayar> createState() => _StatusBayarState();
}

class _StatusBayarState extends State<StatusBayar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Status Pembayaran"),
      ),
      body: FutureBuilder<List>(
        future: TiketkuBloc.tiketku(id_user: widget.iduser),
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
                builder: (context) => Detail(tiketku: tiketku)),
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
