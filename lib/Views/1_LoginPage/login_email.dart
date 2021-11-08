import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Core/colors.dart';
import 'package:ttum/Dao/auth.dart';
import 'package:ttum/Views/2_HomePage/ttum_homepage.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  _LoginWithEmailState createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final _idpassword = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ttum,
        title: const Text("Patron Uygulaması"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Form(
                key: _idpassword,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20.0),
                    const Text(
                      "Lütfen ID ve parolanızı yazınız",
                      style: TextStyle(fontSize: 21,color: ttum,fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "ID boş bırakılamaz";
                          }else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.black87),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail),
                          hintText: "ID",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.black26,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
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
                          hintText: "Parola",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.black26,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    InkWell(
                      onTap: () async {
                        if (_idpassword.currentState!.validate()) {
                          final user =
                          await Provider.of<Auth>(context, listen: false)
                              .signInWithEmailAndPassword(
                              _emailController.text,
                              _passwordController.text);
                          Get.off(const Ttum());
                          if (user != null && !user.emailVerified) {
                            await _showMyDialog();
                            await Provider.of<Auth>(context, listen: false)
                                .signOut();
                          }
                        }
                      },
                      child: Container(
                        width: 150.0,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0.0, 20.0),
                              blurRadius: 15.0,
                              color: Colors.black12,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 50.0,
                              width: 110.0,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 14.0),
                              child: Text(
                                "Giriş",
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .apply(color: Colors.white),
                              ),
                              decoration: const BoxDecoration(
                                color: ttum,
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
                              color: ttum,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    InkWell(
                      onTap: () async {
                        if (_idpassword.currentState!.validate()) {
                          final user =
                          await Provider.of<Auth>(context, listen: false)
                              .signInWithEmailAndPassword(
                              _emailController.text,
                              _passwordController.text);
                          Get.off(const Ttum());
                          if (user != null && !user.emailVerified) {
                            await _showMyDialog();
                            await Provider.of<Auth>(context, listen: false)
                                .signOut();
                          }
                        }
                      },
                      child: Container(
                        width: 150.0,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0.0, 20.0),
                              blurRadius: 15.0,
                              color: Colors.black12,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 50.0,
                              width: 110.0,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 9.0, horizontal: 14.0),
                              child: Text(
                                "Şifremi Unuttum",
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .apply(color: Colors.white),
                              ),
                              decoration: const BoxDecoration(
                                color: ttum,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(85.0),
                                  topLeft: Radius.circular(85.0),
                                  bottomRight: Radius.circular(200.0),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 1.0),
                              child: Icon(
                                IconData(57484, fontFamily: 'MaterialIcons'),
                                size: 30.0,
                                color: ttum,
                              ),
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
                // Navigator.of(context).pop();
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
