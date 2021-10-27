import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Dao/auth.dart';
import 'package:ttum/Models/buttons.dart';
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
    late bool _isLoading = false;
    Future<void> _signInAnonymously() async {
      setState(() {
        _isLoading = true;
      });
      final user =
          await Provider.of<Auth>(context, listen: false).signInAnonymously();
      setState(() {
        _isLoading = false;
      });
      print(user!.uid);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ttumDeneme(),
          ));
    }

    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    void _showButtonPressDialog(BuildContext context, String provider) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$provider butonu basıldı!'),
        backgroundColor: Colors.black26,
        duration: Duration(milliseconds: 500),
      ));
    }

    final _signInFormKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Text("deneme"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: yukseklik * 0.75,
                color: Colors.redAccent,
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Lütfen Giriş Yapınız",
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: TextFormField(
                          validator: (value) {
                            if (!EmailValidator.validate(value!)) {
                              return "E-mail boş bırakılamaz";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mail),
                            hintText: "E-mail",

                            // tıklandığında dış çizgi rengi
                            /*focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),*/

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                color: Colors.black26,
                                width: 2.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: TextFormField(
                          validator: (val){
                            if(val!.length<6){
                              return "Şifreniz en az 6 karakter olmalıdır";
                            }else{
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            hintText: "Şifre",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                color: Colors.black26,
                                width: 2.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.bar_chart),
                            hintText: "Barkod",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                color: Colors.black26,
                                width: 2.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Giriş"),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text("Yeni Kayıt için tıklayınız"),
                      ),
                      InkWell(
                        onTap: _isLoading ? null : _signInAnonymously,
                        child: Container(
                          width: 150.0,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0.0, 20.0),
                                blurRadius: 30.0,
                                color: Colors.black12,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 50.0,
                                width: 110.0,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 14.0),
                                child: Text(
                                  "Anonim",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button!
                                      .apply(color: Colors.black),
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(85.0),
                                    topLeft: Radius.circular(85.0),
                                    bottomRight: Radius.circular(200.0),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.home,
                                size: 30.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*child: Column(
                  children: [
                    Container(
                      width: genislik * 0.6,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Kullanıcı Adı"),
                      ),
                    ),
                    Container(
                      width: genislik * 0.6,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Parola"),
                      ),
                    ),
                    Container(
                      width: genislik * 0.6,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Barkod"),
                      ),
                    ),
                  ],
                ),*/
              ),
            ),

            /*SignInButtonBuilder(
              text: 'Email Giriş',
              icon: Icons.email,
              onPressed: () async {
                _showButtonPressDialog(context, 'Email');
                UserCredential userCredential =
                    await FirebaseAuth.instance.signInAnonymously();
                print(userCredential);
              },
              backgroundColor: Colors.blueGrey[700]!,
              width: 220.0,
            ),*/

            /*ClickedButton(
              icon: Icons.mail,
            ),*/
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => productDefinition()));
              },
              child: Container(
                height: yukseklik * 0.1,
                width: genislik * 0.6,
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
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ttumDeneme()));
              },
              child: Container(
                height: yukseklik * 0.1,
                width: genislik * 0.6,
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
