import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ttum/Dao/auth.dart';
import 'package:ttum/Views/1_LoginPage/on_board.dart';
import 'package:ttum/Views/1_LoginPage/register.dart';
import 'package:ttum/Views/1_LoginPage/reset_password.dart';
import 'package:ttum/Views/2_HomePage/ttum_homepage.dart';
import 'package:ttum/Views/4_SalesManagement/add_sales_amount.dart';
import 'package:ttum/Views/4_SalesManagement/sales_amount.dart';
import 'package:ttum/Views/5_FinanceManagement/finance_management.dart';

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
      child: GetMaterialApp(
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
        ),
        getPages: [
          GetPage(name: "/", page: ()=>const OnBoardWidget()),
          GetPage(name: "/Login", page: ()=>const Login()),
          GetPage(name: "/Ttum", page: ()=>const Ttum()),
          GetPage(name: "/Register", page: ()=>const Register()),
          GetPage(name: "/ResetPassword", page: ()=>const ResetPassword()),
          GetPage(name: "/financeManagement", page: ()=>const financeManagement()),
          GetPage(name: "/salesAmount", page: ()=>const salesAmount()),
          GetPage(name: "/AddSalesAmount", page: ()=>const AddSalesAmount()),
        ],
      ),
    );
  }
}




