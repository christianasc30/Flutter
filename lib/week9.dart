import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Pertemuan1(title: 'Flutter Demo Home Page Buatan sendiri'),
    );
  }
}

class Pertemuan1 extends StatefulWidget {
  const Pertemuan1({super.key, required this.title});


  final String title;

  @override
  State<Pertemuan1> createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Teks Input",
                hintText: "Teks yang akan diinput formatnya sbb",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Teks Input 2",
                hintText: "Teks yang akan diinput formatnya sbb",
                border: OutlineInputBorder(
                   borderRadius: new BorderRadius.circular(5)
                )
                ),
            ),
            ElevatedButton(onPressed: () {}, child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.white
              ),
            ))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
