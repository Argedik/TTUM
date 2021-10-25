import 'package:flutter/material.dart';
import 'package:ttum/Views/2_1_HomePage/ttum_homepage.dart';
import 'package:ttum/Views/2_HomePage/product_definition.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(title: Text("deneme"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:50.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: yukseklik*0.4,
                  color: Colors.redAccent,
                  width: genislik*0.8,
                  child: Column(
                    children: [
                      Container(
                        width: genislik*0.6,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child:const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration:  InputDecoration(
                              border: InputBorder.none,
                              hintText: "Kullanıcı Adı"
                          ),
                        ),
                      ),
                      Container(

                        width: genislik*0.6,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: const TextField(
                          obscureText: true,
                          decoration:  InputDecoration(
                              border: InputBorder.none,
                              hintText: "Parola"
                          ),
                        ),
                      ),
                      Container(
                        width: genislik*0.6,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child:const TextField(
                          decoration:  InputDecoration(
                              border: InputBorder.none,
                              hintText: "Barkod"
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => productDefinition()));
              },
              child: Container(
                height: yukseklik*0.15,
                width: genislik*0.6,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Center(child: Text("Barkod denemesi")),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ttumDeneme()));
              },
              child: Container(
                height: yukseklik*0.15,
                width: genislik*0.6,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Center(child: Text("Patron uygulaması")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
