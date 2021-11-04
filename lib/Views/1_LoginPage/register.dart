import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Dao/auth.dart';
import 'package:ttum/Views/1_LoginPage/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _register = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordCorfirmController = TextEditingController();

  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$provider adresine onay maili gönderilmiştir.'),
      backgroundColor: Colors.black26,
      duration: const Duration(milliseconds: 900),
    ));
  }

  @override
  Widget build(BuildContext context) {
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
                key: _register,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Kayıt Formu",
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: TextFormField(
                        controller: _emailController,
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
                        controller: _passwordController,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: TextFormField(
                        controller: _passwordCorfirmController,
                        validator: (val) {
                          if (val!.length < 6) {
                            return "Şifreniz en az 6 karakter olmalıdır";
                          } else if (val != _passwordController.text) {
                            _showButtonPressDialog(
                                context,
                                _emailController.text.substring(
                                    0, _emailController.text.indexOf("@")));
                            return "Şifreleriniz aynı olmalıdır";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.black87),
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: "Şifre Tekrarı",
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
                      onTap: () async {
                        try{
                          if (_register.currentState!.validate()) {
                            final user =
                                await Provider.of<Auth>(context, listen: false)
                                    .createUserWithEmailAndPassword(
                                        _emailController.text,
                                        _passwordController.text);
                            if (user != null && !user.emailVerified) {
                              await user.sendEmailVerification();
                            }
                            /*await Future.delayed(Duration(seconds: 60));
                          await FirebaseAuth.instance.currentUser!.reload();
                          print("60 sn ${FirebaseAuth.instance.currentUser!.emailVerified}");*/
                            await _showMyDialog();
                            await Provider.of<Auth>(context, listen: false)
                                .signOut();
                            setState(() {
                              Get.to(const Login());
                            });
                          }
                        }
                        on FirebaseAuthException catch(e){print("hata ${e.message}");}
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
                                "Kayıt",
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
                              Icons.how_to_reg,
                              size: 30.0,
                              color: Colors.blueAccent,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Onay gerekiyor'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Lütfen mailinizi kontrol ediniz.'),
                Text('Onay linkini tıklayıp tekrar giriş yapmalısınız.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Anladım'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
