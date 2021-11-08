import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Dao/auth.dart';
import 'package:ttum/Models/buttons.dart';
import 'package:ttum/Views/1_LoginPage/register.dart';
import 'package:ttum/Views/1_LoginPage/reset_password.dart';
import 'package:ttum/Views/2_HomePage/ttum_homepage.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool buttonPressed = false;

  /*void _letsPress() {
    setState(() {
      buttonPressed = true;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    late bool _isLoading = false;
    Future<void> _signInAnonymously() async {
      setState(() {
        _isLoading = true;
      });
      // final user =
      //     await Provider.of<Auth>(context, listen: false).signInAnonymously();
      setState(() {
        _isLoading = false;
        Get.off(const Ttum());
      });
    }

    Future<void> _signInWithGoogle() async {
      setState(() {
        buttonPressed = true;
        _isLoading = true;
      });

      try{
        final user =
            await Provider.of<Auth>(context, listen: false).signInWithGoogle();

        if (user?.uid != null) {
          Get.off(const Ttum());
        }
      }catch(hata){
        print("user id gelmedi hatası $hata");
      }
      setState(() {
        buttonPressed = false;
        _isLoading = false;
      });
    }

    /*void _showButtonPressDialog(BuildContext context, String provider) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$provider butonu basıldı!'),
        backgroundColor: Colors.black26,
        duration: const Duration(milliseconds: 500),
      ));
    }*/

    return Scaffold(
      appBar: AppBar(
        title: const Text("Patron Uygulaması"),
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
                            borderRadius: BorderRadius.circular(25.0),
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
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        if (_signInFormKey.currentState!.validate()) {
                          final user =
                              await Provider.of<Auth>(context, listen: false)
                                  .signInWithEmailAndPassword(
                                      _emailController.text,
                                      _passwordController.text);
                          Get.off( const Ttum());
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
                    Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 15.0,
                                  offset: Offset(0.0, 20.0),
                                ),
                              ],
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
                        SizedBox(
                          height: 50.0,
                          width: 180.0,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Get.to(const Register());

                            },
                            child: const Text(
                              'Yeni Kayıt İçin Tıklayınız',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            width: 122,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 15.0,
                                  offset: Offset(0.0, 20.0),
                                ),
                              ],
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
                            elevation: 55,
                            shadowColor: Colors.black,
                          ),
                          onPressed: () {
                            Get.to(const ResetPassword());
                          },
                          child: const Text(
                            'Şifremi Unuttum',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: _isLoading ? null : _signInWithGoogle,
                      child: buttonPressed
                          ? ButtonTapped(
                              icon: "assets/icons/Google_G_Logo.svg.png")
                          : MyButton(
                              icon: "assets/icons/Google_G_Logo.svg.png"),
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
