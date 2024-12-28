import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  final Key? key;

  const SplashScreen({this.key}) : super(key: key); // Constructor const

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade200,
      body: Column(
        children: [
          //Gambar atas
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/rektorat.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          //Logo dan Text bagian tengah
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo unkhair.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    children: [
                      TextSpan(text: 'Sistem Pendaftaran Pelayanan Kesehatan\n'),
                      TextSpan(text: 'Mahasiswa Baru\n'),
                      TextSpan(text: 'Universitas Khairun'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Gambar bawah
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/unkhair2.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
