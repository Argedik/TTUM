import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Dao/auth.dart';
import 'package:ttum/Views/1_LoginPage/on_board.dart';

import 'Views/1_LoginPage/login.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Provider<Auth>(
      create: (context)=>Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:FutureBuilder(
          future: _initialization,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return const Center(child:Text("Beklenilmeyen bir hata oluştu."));
            }else if(snapshot.hasData){
              return const OnBoardWidget();
              // return const login();
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          }
        )
        //const login(),
      ),
    );
  }
}




