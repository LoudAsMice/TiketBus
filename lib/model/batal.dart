class Batal {
  int? code;
  bool? status;
  String? messages;

  Batal({this.code, this.status, this.messages});

  factory Batal.fromJson(Map<String, dynamic> obj) {
    return Batal(
        code: obj['code'], status: obj['status'], messages: obj['messages']);
  }
}
