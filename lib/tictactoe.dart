import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TicTacToeGame extends StatefulWidget {
  final String yourChoose;

  const TicTacToeGame({
    Key? key,
    required this.yourChoose,
  }) : super(key: key);

  @override
  State<TicTacToeGame> createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  late String square1, square2, square3 = "-";
  late String square4, square5, square6 = "-";
  late String square7, square8, square9 = "-";

  @override
  Widget build(BuildContext context) {
    final database = FirebaseDatabase.instance.reference();
    final titactoeFirebase = database.child("/tictactoe");

    titactoeFirebase.onValue.listen((event) {
      var value = event.snapshot.value;
      square1 = value['square1'].toString();
      square2 = value['square2'].toString();
      square3 = value['square3'].toString();
      square4 = value['square4'].toString();
      square5 = value['square5'].toString();
      square6 = value['square6'].toString();
      square7 = value['square7'].toString();
      square8 = value['square8'].toString();
      square9 = value['square9'].toString();
      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('TIC TAC TOE GAME'),
      ),
      body: Center(
          child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[
          InkWell(
            onTap: () async {
              await titactoeFirebase.update(
                  {'square1': widget.yourChoose.toString()}).then((value) {
                square1 = widget.yourChoose.toString();
                setState(() {});
                log('Done update');
              }).catchError((error) {
                log(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(square1.toString()),
              color: Colors.teal[100],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update(
                  {'square2': widget.yourChoose.toString()}).then((value) {
                setState(() {});
                log('Update xong');
              }).catchError((error) {
                log(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(square2.toString()),
              color: Colors.teal[200],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update(
                  {'square3': widget.yourChoose.toString()}).then((value) {
                setState(() {});
                log('Update xong');
              }).catchError((error) {
                log(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(square3.toString()),
              color: Colors.teal[300],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update(
                  {'square4': widget.yourChoose.toString()}).then((value) {
                setState(() {});
                log('Update xong');
              }).catchError((error) {
                log(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(square4.toString()),
              color: Colors.teal[400],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update(
                  {'square5': widget.yourChoose.toString()}).then((value) {
                setState(() {});
                log('Update xong');
              }).catchError((error) {
                log(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(square5.toString()),
              color: Colors.teal[500],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update(
                  {'square6': widget.yourChoose.toString()}).then((value) {
                setState(() {});
                log('Update xong');
              }).catchError((error) {
                log(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(square6.toString()),
              color: Colors.teal[600],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update(
                  {'square7': widget.yourChoose.toString()}).then((value) {
                setState(() {});
                log('Update xong');
              }).catchError((error) {
                log(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(square7.toString()),
              color: Colors.teal[100],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update(
                  {'square8': widget.yourChoose.toString()}).then((value) {
                setState(() {});
                log('Update xong');
              }).catchError((error) {
                log(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(square8.toString()),
              color: Colors.teal[200],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update(
                  {'square9': widget.yourChoose.toString()}).then((value) {
                setState(() {});
                log('Update xong');
              }).catchError((error) {
                log(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(square9.toString()),
              color: Colors.teal[300],
            ),
          ),
        ],
      )),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
    );
  }
}
