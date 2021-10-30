import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Dao/auth.dart';
import 'package:ttum/Views/1_LoginPage/login.dart';
import 'package:ttum/Views/1_LoginPage/uygulamalar.dart';
import 'package:ttum/Views/2_1_HomePage/ttum_homepage.dart';

class OnBoardWidget extends StatefulWidget {
  const OnBoardWidget({Key? key}) : super(key: key);

  @override
  _OnBoardWidgetState createState() => _OnBoardWidgetState();
}

class _OnBoardWidgetState extends State<OnBoardWidget> {
  //late bool _isLogged;

  /* @override
    void initState(){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        _isLogged = false;
      } else {
        print('User is signed in!');
        _isLogged = true;
      }

      setState(() {});
    });
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context, listen: false);
    return StreamBuilder<User?>(
        stream: _auth.authStatus(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return snapshot.data!= null ? const Ttum() : const Uygulamalar();
          } else {
            return const SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            );
          }
        });


/*    return _isLogged == null
        ? const Center(child: CircularProgressIndicator())
        : _isLogged
            ? ttumDeneme()
            : const login();*/
  }
}
