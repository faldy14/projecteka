import 'package:flutter/material.dart';

class Pertanyaan extends StatelessWidget {
  final String textPertanyaan;
  Pertanyaan(this.textPertanyaan);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(textPertanyaan,
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
    ),
    );
  }
}

class TombolPilihan extends StatelessWidget {
  final Function _fungsipilihJawaban;
  TombolPilihan(this._fungsipilihJawaban);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: RaisedButton(
        child: Text("0",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.purple,
        onPressed: _fungsipilihJawaban,
      ),
    );
  }
}

class TombolPilihan1 extends StatelessWidget {
  final Function _fungsipilihJawaban;
  TombolPilihan1(this._fungsipilihJawaban);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: RaisedButton(
        child: Text("1",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.purple,
        onPressed: _fungsipilihJawaban,
      ),
    );
  }
}