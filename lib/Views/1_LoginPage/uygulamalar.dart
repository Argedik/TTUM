import 'package:flutter/material.dart';
import 'package:ttum/Views/1_LoginPage/login.dart';
import 'package:ttum/Views/2_1_HomePage/ttum_homepage.dart';
import 'package:ttum/Views/2_HomePage/product_definition.dart';

class Uygulamalar extends StatefulWidget {
  const Uygulamalar({Key? key}) : super(key: key);

  @override
  _UygulamalarState createState() => _UygulamalarState();
}

class _UygulamalarState extends State<Uygulamalar> {
  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Uygulamalar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const productDefinition()));
              },
              child: Container(
                height: yukseklik * 0.1,
                width: genislik * 0.6,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: const Center(child: Text("Barkod denemesi")),
              ),
            ),
            SizedBox(height: 20.0,),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: Container(
                height: yukseklik * 0.1,
                width: genislik * 0.6,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: const Center(child: Text("Patron uygulaması")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
