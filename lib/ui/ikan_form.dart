import 'package:flutter/material.dart';
import 'package:responsiikan/ui/ikan_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:responsiikan/bloc/ikan_bloc.dart';
import 'package:responsiikan/model/ikan.dart';
import 'package:responsiikan/ui/ikan_page.dart';


class IkanForm extends StatefulWidget {
Ikan? ikan;

IkanForm({Key? key, this.ikan}) : super(key: key);

@override
_IkanFormState createState() => _IkanFormState();
}

class _IkanFormState extends State<IkanForm> {
final _formKey = GlobalKey<FormState>();
bool _isLoading = false;
String judul = "TAMBAH Ikan";
String tombolSubmit = "SIMPAN";

final _namaTextboxController = TextEditingController();
final _jenisTextboxController = TextEditingController();
final _warnaTextboxController = TextEditingController();
final _habitatTextboxController = TextEditingController();


@override
void initState() {
super.initState();
isUpdate();
}

isUpdate() {
if (widget.ikan != null) {
setState(() {
judul = "UBAH IKAN";
tombolSubmit = "UBAH";
_namaTextboxController.text = widget.ikan!.nama!;
_jenisTextboxController.text = widget.ikan!.jenis!;
_warnaTextboxController.text = widget.ikan!.warna!;
_habitatTextboxController.text = widget.ikan!.habitat!;});
} else {
judul = "TAMBAH IKAN";
tombolSubmit = "SIMPAN";
}
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text(judul)),
body: SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.all(8.0),
child: Form(
key: _formKey,
child: Column(
children: [
_namaTextField(),
_jenisTextField(),
_warnaTextField(),
_habitatTextField(),
_buttonSubmit()
],
),
),
),
),
);
}

//Membuat Textbox Kode Ikan
Widget _namaTextField() {
return TextFormField(
decoration: const InputDecoration(labelText: "Nama Ikan"),
keyboardType: TextInputType.text,
controller: _namaTextboxController,
validator: (value) {
if (value!.isEmpty) {
return "Kode Ikan harus diisi";
}
return null;
},
);
}

//Membuat Textbox Nama Ikan
Widget _warnaTextField() {
return TextFormField(
decoration: const InputDecoration(labelText: "Warna Ikan"),
keyboardType: TextInputType.text,
controller: _warnaTextboxController,
validator: (value) {
if (value!.isEmpty) {
return "Nama Ikan harus diisi";
}
return null;
},
);
}

//Membuat Textbox Harga Ikan
Widget _jenisTextField() {
return TextFormField(
decoration: const InputDecoration(labelText: "Jenis"),
keyboardType: TextInputType.number,
controller: _jenisTextboxController,
validator: (value) {
if (value!.isEmpty) {
return "Harga harus diisi";
}
return null;
},
);
}

Widget _habitatTextField() {
return TextFormField(
decoration: const InputDecoration(labelText: "Habitat"),
keyboardType: TextInputType.number,
controller: _habitatTextboxController,
validator: (value) {
if (value!.isEmpty) {
return "Harga harus diisi";
}
return null;
},
);
}

//Membuat Tombol Simpan/Ubah
Widget _buttonSubmit() {
return OutlinedButton(
child: Text(tombolSubmit),
onPressed: () {
var validate = _formKey.currentState!.validate();
if (validate) {
if (!_isLoading) {
if (widget.ikan != null) {
//kondisi update ikan
ubah();
} else {
//kondisi tambah ikan
simpan();
}
}
}
});
}

simpan() {
setState(() {
_isLoading = true;
});
Ikan createIkan = Ikan(id: null);
createIkan.nama = _namaTextboxController.text;
createIkan.jenis = _jenisTextboxController.text;
createIkan.warna = _warnaTextboxController.text;
createIkan.habitat = _habitatTextboxController.text;


IkanBloc.addIkan(ikan: createIkan).then((value) {
Navigator.of(context).push(MaterialPageRoute(
builder: (BuildContext context) => const IkanPage()));
},);
setState(() {
_isLoading = false;
});
}

ubah() {
setState(() {
_isLoading = true;
});
Ikan updateIkan = Ikan(id: null);
updateIkan.id = widget.ikan!.id;
updateIkan.nama = _namaTextboxController.text;
updateIkan.jenis = _jenisTextboxController.text;
updateIkan.warna = _warnaTextboxController.text;
updateIkan.habitat = _habitatTextboxController.text;

IkanBloc.updateIkan(ikan: updateIkan).then((value) {
Navigator.of(context).push(MaterialPageRoute(
builder: (BuildContext context) => const IkanPage()));
},);
setState(() {
_isLoading = false;
});
}
}