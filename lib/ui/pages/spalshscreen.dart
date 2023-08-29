import 'dart:async';
import 'package:flutter/material.dart';
import 'package:skripsi/ui/pages/loginadmin.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/homepage');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/bg-login.jpg"), // Ganti dengan path gambar Anda
            fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.only(bottom: 330),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/logotonasa.png"), // Ganti dengan path gambar Anda
                    fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                  ),
                ),
              ),
              Text(
                'PT. Semen Tonasa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
