import 'package:flutter/material.dart';
import 'login.dart'; // Import LoginScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login & Dashboard App',
      home: LoginScreen(), // Menampilkan login screen sebagai tampilan awal
    );
  }
}