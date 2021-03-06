import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adauntukkamu/kutomisasi.dart';


class Halamanawalbanget extends StatefulWidget {
  @override
  _HalamanawalbangetState createState() => _HalamanawalbangetState();
}

class _HalamanawalbangetState extends State<Halamanawalbanget> {

  //fungsi
  var pertanyaanIndex = 0;
  var nilaiHasil = 0;

  void klikjawaban(){
    setState(() {
    pertanyaanIndex++;
    });
    print(pertanyaanIndex);
  }

  void klikjawaban1(){
    setState(() {
    pertanyaanIndex++;
    nilaiHasil = nilaiHasil + 2;
    });
    print(pertanyaanIndex);
  }

  //fungsi merubah halaman
  //berubah == ubahpertanyaan <-- kalau "berubah" ada error sini woi kiw kiw//
  //ubahpertanyaan = dokumen
  var ubahpertanyaan = 0;
  //buatdokumen = buat dokumen firestore
  var buatdokumen = 0;
  void fungsitombol(){
    //fungsi benernya
    setState(() {
      if (buatdokumen == 5){
      buatdokumen = 0;
      ubahpertanyaan++;
      }
      buatdokumen++;
    });
    //if tombol dipencet nambah jadi case apa
  }

  /*var pertanyaan = [
    'Pertanyaan 1',
    'Pertanyaan 2',
    'Pertanyaan 3',
    'Pertanyaan 4',
    'Pertanyaan 5',
    'Pertanyaan 6',
    'Pertanyaan 7',
    'Pertanyaan 8',
    'Pertanyaan 9'
  ];

  final isiPertanyaan = [
    {"soal" : "Pertanyaan 1", "Jawaban" : ['0','1','2','3','4']},
    {"soal" : "Pertanyaan 2", "Jawaban" : ['0','1','2','3','4']},
    {"soal" : "Pertanyaan 3", "Jawaban" : ['0','1','2','3','4']},
    {"soal" : "Pertanyaan 4", "Jawaban" : ['0','1','2','3','4']},
    {"soal" : "Pertanyaan 5", "Jawaban" : ['0','1','2','3','4']},
    {"soal" : "Pertanyaan 6", "Jawaban" : ['0','1','2','3','4']},
    {"soal" : "Pertanyaan 7", "Jawaban" : ['0','1','2','3','4']},
    {"soal" : "Pertanyaan 8", "Jawaban" : ['0','1','2','3','4']},
    {"soal" : "Pertanyaan 9", "Jawaban" : ['0','1','2','3','4']}
  ];*/


  @override
  Widget build(BuildContext context) {
    //pertanyaan
    //Tutorial Quiz
    return Scaffold(
      body: SafeArea(/* //aslinya
        //ini maksudnya if else
        child: pertanyaanIndex<isiPertanyaan.length ? Column(
          children: <Widget>[
            Pertanyaan(pertanyaan[pertanyaanIndex]),
            TombolPilihan(klikjawaban),
            TombolPilihan1(klikjawaban1),
            Text("$pertanyaanIndex"),
            Text("$nilaiHasil"),
            Text("${nilaiHasil/100*40}")
          ],
      ) : 
        Container(
          color: Colors.red,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text("Berikut adalah hasil dari jawaban kamu dsb. dsb."),
              RaisedButton(
                child: Text("Lanjut"),
                onPressed: (){
                  if (nilaiHasil/100*40>5){
                    print("Cakep");
                  }
                  else print("Jelek");
                },
              ),
            ],
          )
        ) */

        child:Container(
          child: Column(
              children: <Widget>[
                //soal
                StreamBuilder(
                  //pake getDocuments() coba biar ambil semua data di document
                  stream: Firestore.instance
                  .collection("cobapertanyaan")
                  //coba bikin di 1 koleksi dulu 1 dokumen juga
                  .document("$ubahpertanyaan")
                  .snapshots(),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      //loading muter nanti pindahin keluar
                    return CircularProgressIndicator();
                    }
                  var userDocument = snapshot.data;
                    //udah bener sekarang tinggal di pilih biar random
                    return Text(userDocument["$buatdokumen"],
                      style: TextStyle(fontSize: 22),
                    );
                  }
                ),
                // jadi ntar soalnya tuh collection trus document nah documenntya jadi 1 2 trus di pakein fungsi tambah2an jadi bisa random
                // nah di userdocumentnya juga tuh jadi fungsi increment biar bisa berubah2
                TombolPilihan(fungsitombol),
              ],
            ),
        )
            
      ), 
    );
  }
}