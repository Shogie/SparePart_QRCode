import 'package:flutter/material.dart';
import 'package:skripsi/shared/theme,.dart';

class LoginAdmin extends StatelessWidget {
  const LoginAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 100),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/logotonasa.png"), // Ganti dengan path gambar Anda
                    fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget usernameInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Username',
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Masukkan Username Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultradius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultradius,
                    ),
                    borderSide: BorderSide(
                      color: bgdefault,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget passwordInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Masukkan Password Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultradius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultradius,
                    ),
                    borderSide: BorderSide(
                      color: bgdefault,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget submitButton() {
        return Container(
          width: double.infinity,
          height: 55,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/homepage');
            },
            style: TextButton.styleFrom(
              backgroundColor: btngetstarted,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  defaultradius,
                ),
              ),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(119, 153, 175, 176),
          borderRadius: BorderRadius.circular(
            defaultradius,
          ),
        ),
        child: Column(
          children: [
            usernameInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgdefault,
      body: ListView(
        children: [logo(), inputSection()],
      ),
    );
  }
}
