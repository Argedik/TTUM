import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ttumDeneme extends StatefulWidget {
  const ttumDeneme({Key? key}) : super(key: key);

  @override
  _ttumDenemeState createState() => _ttumDenemeState();
}

class _ttumDenemeState extends State<ttumDeneme> {
  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.blueAccent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 80,
                child: DrawerHeader(
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                  child: Center(
                    child: Text("Tüm Teknoloji Merkezi",
                      style: TextStyle(color: Colors.white,
                        fontSize: 23
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.blueAccent),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.dashboard,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("DASHBOARD",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                      SizedBox(width: 150.0,),
                      Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("FIRSAT",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                      SizedBox(width: 180.0,),
                      Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("AKTİVİTE",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("TEKLİF",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("SİPARİŞ",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("İRSALİYE",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("FATURA",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("İNSAN KAYNAKLARI",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("TEKNİK SERVİS",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("ANALİZ",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("FÖYLER",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("SAYIM",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF416BA9),
                  border: Border(
                    bottom: BorderSide(
                        width: 4.0,
                        style: BorderStyle.solid,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                child: Container(
                  height: 45,
                  color: Color(0xFF416BA9),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Icon(Icons.list_alt,color: Colors.white,),
                      SizedBox(width: 20.0,),
                      Text("AYARLAR",style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Column(
          children: const [
             Text("Aktif Varlıklar"),
            Text(
              "Finans Analizi",
              style: TextStyle(
                fontWeight:FontWeight.w300,
                fontSize: 15,
              ),

            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment(-1.3, -1.3),
              end: Alignment(1.3, 1.3),
              colors: [Colors.yellowAccent, Colors.redAccent],
            ),
            border: Border(
              top: BorderSide(color: Colors.orangeAccent),
            ),
          ),

          //padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Center(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) {
                var asdf;
                return  Card(
                    //kod dışarı taşmasın clip.antialias
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.all(8),
                    borderOnForeground: true,
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    semanticContainer: true,
                    color: Colors.blueAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:const [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text("CARİ ALACAK",style: TextStyle(
                                    color: Colors.white,
                                    fontWeight:FontWeight.w400,
                                    fontSize: 10,),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text("3.935.198,38 TL",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight:FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            height: yukseklik*0.12,
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: const Icon(
                              Icons.map,
                              size: 20,
                              color:  Colors.white,)
                        ),

                      ],
                    ),
                  );
              },
            ),
          ),
        ),
      ),
    );
  }
}
