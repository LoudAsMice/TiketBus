import 'package:flutter/material.dart';
import 'package:tokokita/ui/cari_tiket.dart';

class JadwalPesan extends StatefulWidget {
  const JadwalPesan({Key? key}) : super(key: key);

  @override
  State<JadwalPesan> createState() => _JadwalPesanState();
}

class _JadwalPesanState extends State<JadwalPesan> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  TextEditingController _kotaAsalController = TextEditingController();
  TextEditingController _kotaTujuanController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Pencarian Jadwal"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _kotaAsalField(),
                  _kotaTujuanField(),
                  _tanggalField(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buttonSubmit(),
    );
  }

  Widget _kotaAsalField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Kota Asal"),
      keyboardType: TextInputType.text,
      controller: _kotaAsalController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ketik kota asal';
        }
        return null;
      },
    );
  }

  Widget _kotaTujuanField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Kota Tujuan"),
      keyboardType: TextInputType.text,
      controller: _kotaTujuanController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ketik kota tujuan';
        }
      },
    );
  }

  Widget _tanggalField() {
    return TextFormField(
        decoration: InputDecoration(labelText: "dd/mm/yyyy"),
        keyboardType: TextInputType.datetime,
        controller: _tanggalController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Masukkan Tanggal';
          }
        });
  }

  Widget _buttonSubmit() {
    return SizedBox(
      height: 50.0,
      child: ElevatedButton(
        child: Text("Cari"),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            if (!_isLoading) {
              _submit(context);
            }
          }
        },
      ),
    );
  }

  void _submit(BuildContext context) {
    String? asal = _kotaAsalController.text;
    String? tujuan = _kotaTujuanController.text;
    String? tanggal = _tanggalController.text;

    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) =>
            CariTiket(asal: asal, tujuan: tujuan, tanggal: tanggal),
      ),
    );
    setState(() {
      _isLoading = false;
    });
  }
}
