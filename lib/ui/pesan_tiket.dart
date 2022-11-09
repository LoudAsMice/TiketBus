import 'package:flutter/material.dart';
import 'package:tokokita/model/tiketbus.dart';
import 'package:tokokita/ui/konfirmasi_tiket.dart';

class PesanTiket extends StatefulWidget {
  Tiketbus? tiketbus;

  PesanTiket({this.tiketbus});

  @override
  State<PesanTiket> createState() => _PesanTiketState();
}

class _PesanTiketState extends State<PesanTiket> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  TextEditingController _namaController = TextEditingController();
  TextEditingController _hpController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Pesan Tiket"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
              Text('Input Data Pemesanan', style: TextStyle(fontSize: 30)),
              _namaField(),
              _hpField(),
              _jumlahField(),
              _buttonOk()
            ],
          ),
        ),
      ),
    );
  }

  Widget _namaField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Nama'),
        keyboardType: TextInputType.text,
        controller: _namaController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Nama harus diisi";
          }
        });
  }

  Widget _hpField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'No. HP'),
        keyboardType: TextInputType.phone,
        controller: _hpController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Nomor Handphone harus diisi";
          }
        });
  }

  Widget _jumlahField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Jumlah Tiket'),
        keyboardType: TextInputType.number,
        controller: _jumlahController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Jumlah tiket harus diisi";
          }
        });
  }

  Widget _buttonOk() {
    return ElevatedButton(
      child: Text("Ok"),
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
    String? nama = _namaController.text;
    String? hp = _hpController.text;
    int? jumlah = int.parse(_jumlahController.text);

    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => KonfirmasiTiket(
            tiketbus: widget.tiketbus, nama: nama, hp: hp, jumlah: jumlah),
      ),
    );
    setState(() {
      _isLoading = false;
    });
  }
}
