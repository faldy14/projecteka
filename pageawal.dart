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
  var berubah = 0;
  var buatdokumen = 0;
  void fungsitombol(){
    setState(() {
      berubah++;
      buatdokumen++;
    });
    print(berubah);
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

        child: /*StreamBuilder(
          stream: Firestore.instance.collection('cobapertanyaan').snapshots(),
          builder: (context, snapshot){
            if (!snapshot.hasData){
              return Text("Loading");
            }
            return ListView.builder(
              itemExtent: 80,
              itemCount: 2,
              itemBuilder: (context, index){
                return _bikinlist(context, snapshot.data.documents[index]);
              },
            );
          },
        ),*/
            Column(
              children: <Widget>[
                //soal
                StreamBuilder(
                  stream: Firestore.instance.collection('cobapertanyaan').document('cobahostility').snapshots(),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                    return Text("Loading");
                    }
                  var userDocument = snapshot.data;
                    //tuh 0 diubah jadi increment lah
                    return Text(userDocument["$buatdokumen"]);
                  }
                ),

                //sini liat

                // jadi ntar soalnya tuh collection trus document nah documenntya jadi 1 2 trus di pakein fungsi tambah2an jadi bisa random
                // nah di userdocumentnya juga tuh jadi fungsi increment biar bisa berubah2
                TombolPilihan(fungsitombol),
              ],
            )
            
      ), 
    );
  }

  /*Widget _bikinlist(BuildContext context, DocumentSnapshot document){
    return ListTile(
      title: Text(document['1']),
      //subtitle: Text(document['2']),
    );
  }*/
}