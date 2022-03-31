// ignore_for_file: avoid_print

import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:tictactoe/tictactoe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Tic Tac Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  var price = "01";
  var description = "This is Desc";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    //dailySpecial
    final dailySpecialRef = database.child("/dailySpecial");

    dailySpecialRef.onValue.listen((event) {
      var value = event.snapshot.value;
      widget.description = value['description'].toString();
      widget.price = value['price'].toString();
      setState(() {});
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: [
          InkWell(
              onTap: () async {
                dailySpecialRef.onValue.listen((event) {
                  var value = event.snapshot.value;
                  setState(() {
                    widget.description = value['description'].toString();
                    widget.price = value['price'].toString();
                    if (kDebugMode) {
                      print(widget.description);
                    }
                    // ignore: avoid_print
                    print(widget.price);
                  });
                });
              },
              child: const Text('Read Text')),
          const Text('Price'),
          Text(widget.price),
          const Text('Description'),
          Text(widget.description),
          OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TicTacToeGame(
                            yourChoose: "X",
                          )),
                );
              },
              child: const Text('TicTacToe : X')),
          OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TicTacToeGame(
                            yourChoose: "O",
                          )),
                );
              },
              child: const Text('TicTacToe : O'))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            print('Click here');

            Random random = Random();
            int randomNumber = random.nextInt(1000);
            await dailySpecialRef.set({
              'description': 'TEST-' + randomNumber.toString(),
              'price': randomNumber.toString()
            }).then((value) {
              setState(() {});
              print('Update xong');
            }).catchError((error) {
              print(error);
            });

            print('Click here END');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
