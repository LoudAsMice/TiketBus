import 'package:flutter/material.dart';
import 'package:tokokita/bloc/tiketku_bloc.dart';
import 'package:tokokita/ui/batal_konfirmasi.dart';
import 'package:tokokita/widget/warning_dialog.dart';

class BatalPesan extends StatefulWidget {
  const BatalPesan({Key? key}) : super(key: key);

  @override
  State<BatalPesan> createState() => _BatalPesanState();
}

class _BatalPesanState extends State<BatalPesan> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _id = TextEditingController();
  TextEditingController _nama = TextEditingController();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Batalkan Pemesanan"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _idField(),
              _namaField(),
              SizedBox(height: 10),
              _buttonOk()
            ],
          ),
        ),
      ),
    );
  }

  Widget _idField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "ID Pesan"),
      keyboardType: TextInputType.number,
      controller: _id,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ketik ID Pesan';
        }
        return null;
      },
    );
  }

  Widget _namaField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Nama"),
      keyboardType: TextInputType.text,
      controller: _nama,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ketik Nama';
        }
      },
    );
  }

  Widget _buttonOk() {
    return ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          if (!_isLoading) {
            _submit();
          }
        }
      },
    );
  }

  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    TiketkuBloc.tiket(id: _id.text, nama: _nama.text).then((value) async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BatalKonfirmasi(tiketku: value)));
    }, onError: (error) {
      print(error);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => WarningDialog(
                description: "Data tidak ditemukan!",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
