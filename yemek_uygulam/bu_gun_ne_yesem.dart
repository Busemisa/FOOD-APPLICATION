import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 234, 234, 234),
          centerTitle: true,
          title: Text(
            'BUGÜN NE YESEM?',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}


class YemekSayfasi extends StatefulWidget {
  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo =1; 
  int yemekNo=1;
  int tatliNo=1;

  List<String> corbaAdlari=[
    'Mercimek',
    'Tarhana',
    'Tavuksuyu',
    'Düğün Çorbası',
    'Yoğurtlu çorba'
    ];

    List<String> yemekAdlari=[
      'Karnıyarık',
      'Mantı',
      'Kuru Fasulye',
      'İçli Köfte',
      'Izgara Balık'

    ];

    List<String> tatliAdlari=[
      'Kadayıf',
      'Baklava',
      'Sütlaç',
      'Kazandibi',
      'Dondurma'
     

    ];




  void yemekleriYenile(){
    setState(() {
                    corbaNo=Random().nextInt(5) +1 ; //ilk hali 0 ile 4 idi 1 ekleyerek 1 ile 5 arasına almış olduk
                    yemekNo=Random().nextInt(5) +1;
                    tatliNo=Random().nextInt(5) +1;
                    
                  });

  }






  @override 
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: yemekleriYenile,
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Image.asset('images/corba_$corbaNo.jpg')),
          )),
          Text(
            corbaAdlari[corbaNo-1],
            style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 200,
              child: Divider(
                height: 5,
                color: Colors.black,
              ),
            ),



          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: yemekleriYenile,
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 255, 251),
              ),

              child: Image.asset('images/yemek_$yemekNo.jpg')),
          )),
          Text(
            yemekAdlari[yemekNo-1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 200,
            child: Divider(
              height: 5,
              color: Colors.black,
            ),
          ),






          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: yemekleriYenile,
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Image.asset('images/tatli_$tatliNo.jpg')),
          )),
          Text(
            tatliAdlari[tatliNo-1],
            style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 200,
              child: Divider(
                height: 5,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }
}



