import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Dao/auth.dart';
import 'package:ttum/Models/buttons.dart';
import 'package:ttum/Views/1_LoginPage/register.dart';
import 'package:ttum/Views/2_1_HomePage/ttum_homepage.dart';
import 'package:ttum/Views/2_HomePage/product_definition.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _signInFormKey = GlobalKey<FormState>();

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
            builder: (context) => const ttumDeneme(),
          ));
    }

    void _showButtonPressDialog(BuildContext context, String provider) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$provider butonu basıldı!'),
        backgroundColor: Colors.black26,
        duration: const Duration(milliseconds: 500),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Patron Uygulaması"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
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
                          if (value!.isEmpty) {
                            return "E-mail boş bırakılamaz";
                          } else if (!value.contains("@")) {
                            return "@ karakterini girmeyi unuttunuz";
                            //email validator de hem "@" harfini hemde "." girilmesi bekleniyor
                          } else if (!EmailValidator.validate(value)) {
                            return "Lütfen E-mail adresinizi kontrol ediniz";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.black87),
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
                        validator: (val) {
                          if (val!.length < 6) {
                            return "Şifreniz en az 6 karakter olmalıdır";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.black87),
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
                    InkWell(
                      onTap: () {
                        if (!_signInFormKey.currentState!.validate()) {
                          return;
                        }
                      },
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
                                "Giriş",
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .apply(color: Colors.white),
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
                              Icons.login,
                              size: 30.0,
                              color: Colors.blueAccent,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
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
                                    .apply(color: Colors.white),
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
                              color: Colors.blueAccent,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF416BA9),
                                    Color(0xFF468FD4),
                                    Color(0xFF416BA9),
                                    Color(0xFF468FD4),
                                    Color(0xFF416BA9),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Register()));
                            },
                            child: const Text('Yeni Kayıt için tıklayınız',
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
          ],
        ),
      ),
    );
  }
}
