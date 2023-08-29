import 'package:flutter/material.dart';
import 'package:skripsi/ui/pages/datasparepart.dart';
import 'package:skripsi/ui/pages/datastatus.dart';
import 'package:skripsi/ui/pages/detaildatasparepart.dart';
// import 'package:skripsi/ui/pages/getstarted.dart';
import 'package:skripsi/ui/pages/homepage.dart';
import 'package:skripsi/ui/pages/loginadmin.dart';
import 'ui/pages/spalshscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        // '/get-started': (context) => GetStartedPage(),
        '/loginadmin': (context) => LoginAdmin(),
        '/homepage': (context) => HomePage(),
        '/dataalat': (context) => DataSparepart(),
        '/datastatus': (context) => DataStatus(),

        // '/detailalat': (context) => DetailDataSparepart(),
      },
    );
  }
}
