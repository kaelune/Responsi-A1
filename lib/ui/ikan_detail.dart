import 'package:flutter/material.dart';
import 'package:responsiikan/ui/ikan_form.dart';
import 'package:responsiikan/ui/ikan_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:responsiikan/model/ikan.dart';
import 'package:responsiikan/bloc/ikan_bloc.dart';


class IkanDetail extends StatefulWidget {
Ikan? ikan;

IkanDetail({Key? key, this.ikan}) : super(key: key);

@override
_IkanDetailState createState() => _IkanDetailState();
}

class _IkanDetailState extends State<IkanDetail> {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Detail Ikan'),

),
body: Center( child: 
Column(
children: [ 
Text(
"nama : ${widget.ikan!.nama}",
style: const TextStyle(fontSize: 20.0),
),
Text(
"Warna : ${widget.ikan!.warna}",
style: const TextStyle(fontSize: 18.0),
),
Text(
"Jenis : Rp ${widget.ikan!.jenis}",
style: const TextStyle(fontSize: 18.0),
),
Text(
"habitat : Rp ${widget.ikan!.habitat}",
style: const TextStyle(fontSize: 18.0),
),
_tombolHapusEdit()
],
),
),
);
}

Widget _tombolHapusEdit() {
return Row(
mainAxisSize: MainAxisSize.min,
children: [
//Tombol Edit
OutlinedButton(
child: const Text("EDIT"),
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => IkanForm(
ikan: widget.ikan!,
)));
}),
//Tombol Hapus
OutlinedButton(
child: const Text("DELETE"), onPressed: () => confirmHapus(widget.ikan!)),
],
);
}

void confirmHapus(ikan) {
AlertDialog alertDialog = AlertDialog(
content: const Text("Yakin ingin menghapus data ini?"),
actions: [
//tombol hapus
OutlinedButton(
child: const Text("Ya"),
onPressed: () async {
IkanBloc.deleteIkan(id: ikan.id).then((value) => 
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => IkanPage()
)));
},
),
//tombol batal
OutlinedButton(
child: const Text("Batal"),
onPressed: () => Navigator.pop(context),
)
],
);

showDialog(builder: (context) => alertDialog, context: context);
}
}
