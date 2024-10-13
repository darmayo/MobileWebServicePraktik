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
      theme: ThemeData(
        primarySwatch: Colors.purple, // Menambahkan tema utama
      ),
      home: LoginScreen(), // Menampilkan login screen sebagai tampilan awal
    );
  }
}