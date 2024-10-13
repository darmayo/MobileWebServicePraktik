import 'package:flutter/material.dart';
import 'dashboard.dart'; // Import Dashboard untuk navigasi setelah login

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Menambahkan FocusNode untuk email dan password
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // Membersihkan focus nodes
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0, // Menghilangkan bayangan AppBar
      ),
      resizeToAvoidBottomInset: true, // Menangani keyboard yang muncul
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gambar di bagian atas
              Image.asset(
                'assets/images/login_image.png', // Ganti dengan path gambar yang sesuai
                height: 200,
              ),
              SizedBox(height: 16),
              // Label Login
              Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // TextField untuk Email
              TextField(
                focusNode: _emailFocusNode, // Fokus untuk Email
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  // Pindahkan fokus ke kolom Password ketika email diisi
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
              ),
              SizedBox(height: 16),
              // TextField untuk Password
              TextField(
                focusNode: _passwordFocusNode, // Fokus untuk Password
                obscureText: true, // Password di-hidden
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Tambahkan aksi untuk lupa password
                  },
                  child: Text('Forgot Password?'),
                ),
              ),
              SizedBox(height: 16),
              // Tombol Login
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke dashboard ketika login sukses
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, // Warna tombol kuning
                  minimumSize: Size(double.infinity, 50), // Full width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Membuat sudut melengkung
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Teks Or dan Register
              Text('Or'),
              TextButton(
                onPressed: () {
                  // Tambahkan aksi untuk register
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}