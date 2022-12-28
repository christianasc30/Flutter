import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class updateMahasiswa extends StatefulWidget {
  const updateMahasiswa({Key? key, required this.id, required this.nim, required this.nama, required this.alamat, required this.email, required this.foto, required this.nim_progmob}) : super(key: key);
  final String nim;
  final String id;
  final String nama;
  final String alamat;
  final String email;
  final String foto;
  final String nim_progmob;


  @override
  State<updateMahasiswa> createState() => _updateMahasiswaState();
}

class _updateMahasiswaState extends State<updateMahasiswa> {
  List _get = [];
  Future _getDataMhs() async{
    try{
      final response = await http.get(Uri.parse(
          'https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/72200441'
      ));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        setState((){
          _get.clear();
          _get = data;
        });
      }
    }catch(e){}
  }
  @override
  void initState(){
    super.initState();
    _getDataMhs();
    idController.text = widget.id;
    namaController.text = widget.nama;
    nimController.text = widget.nim;
    alamatController.text = widget.alamat;
    emailController.text = widget.email;
    fotoController.text = widget.foto;

  }
  final _formKey = GlobalKey<FormState>();
  Future<List>? resp;

  TextEditingController idController = new TextEditingController();
  TextEditingController namaController = new TextEditingController();
  TextEditingController nimController = new TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController nimprogmobController = new TextEditingController(text: "72200441");
  TextEditingController fotoController = new TextEditingController();

  Future<List> updateMhs(String id, nama,nim,alamat,email,foto, nim_progmob) async {
    final http.Response response = await http.post(
      Uri.parse('https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/update'),
      headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'nama': nama,
        'nim': nim,
        'alamat': alamat,
        'email': email,
        'foto': foto,
        'nim_progmob': nim_progmob
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load response');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Mahasiswa"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: idController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: namaController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: nimController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: alamatController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: fotoController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: nimprogmobController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    resp = updateMhs(idController.text, namaController.text, nimController.text, alamatController.text, emailController.text,
                        fotoController.text, nimprogmobController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
