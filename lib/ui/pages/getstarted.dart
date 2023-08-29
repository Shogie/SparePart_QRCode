import 'package:flutter/material.dart';
import 'package:skripsi/shared/theme,.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/get-started.jpg"), // Ganti dengan path gambar Anda
                fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 220,
                  height: 55,
                  margin: EdgeInsets.only(top: 50),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/loginadmin');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: btngetstarted,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultradius),
                      ),
                    ),
                    child: Text(
                      'Admin',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 220,
                  height: 55,
                  margin: EdgeInsets.only(top: 50),
                  child: TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/loginuser');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: btngetstarted,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultradius),
                      ),
                    ),
                    child: Text(
                      'User',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
