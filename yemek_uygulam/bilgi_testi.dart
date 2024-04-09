import 'package:deneme2/ilk_dersler/test_veri.dart';
import 'package:flutter/material.dart';
import 'constants.dart'; //sabitlerimizi ayrı bir dosya içinde tuttuğumıuz için o dosyayı dahil ettik tğm constlar orda düzenli bir şekilde tutulamktadır

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  //stateless widget durumu değişmeyen sabit kalan widgetlardan oluşan yapıdır normal home sayfası ve appbar gibi basit yapıların oluşmasını sağlar
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  //statefull widgetler durum değişiklerine elverişli ve daha komplex yapılarda kullanılabilir 2 adet widget ağacından oluşur otomatikmen bu şekilde oluşur
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  TestVeri test_1 =
      TestVeri(); //nesne oluşturuldu açılan TestVeri classından test_1 isimli nesne oluştu bu test_1 nesneindne ulaşılabilecek değerler var . ile ulaşılabilecek


  void butonFonksiyonu(bool secilenButon) {
    if(test_1.testBittiMi()==true){
      
      test_1.testiSifirla();
      secimler=[];


    }

  else{
     setState(() {
      test_1.getSoruYaniti() == secilenButon
          ? secimler.add(kDogruIconu)
          : secimler.add(kYanlisIconu);

      test_1.sonrakiSoru();
      //secimler.add(kYanlisIconu);
    });
  }

   
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 3,
          spacing: 20,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            butonFonksiyonu(false);
                          },
                          icon: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          label: Text('Thumb Down'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[400],
                            padding: EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            butonFonksiyonu(true);
                          },
                          icon: Icon(Icons.thumb_up, size: 30.0),
                          label: Text('Thumb Up'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[400],
                            padding: EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ))),
              ])),
        )
      ],
    );
  }
}
