import 'package:flutter/material.dart';
import 'login.dart'; // Import login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login & Register with OTP',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(), // Menampilkan login screen sebagai tampilan awal
    );
  }
}