import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Untuk mengkonversi JSON
import 'dashboard.dart'; // Import Dashboard
import 'register.dart'; // Import Register

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  bool isOtpSent = false; // Menyimpan status apakah OTP sudah dikirim atau belum

  Future<void> login() async {
    // Simulasi login API request
    final response = await http.post(
      Uri.parse('https://your-backend-url/login'), // Ganti dengan URL API login
      body: jsonEncode({
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        isOtpSent = true;
      });
      print('Login successful, OTP sent');
    } else {
      print('Login failed');
    }
  }

  Future<void> verifyOtp() async {
    // Verifikasi OTP
    final response = await http.post(
      Uri.parse('https://your-backend-url/verify-otp'), // Ganti dengan URL API verifikasi OTP
      body: jsonEncode({
        'email': _emailController.text,
        'otp': _otpController.text,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Jika verifikasi berhasil, navigasi ke dashboard
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      print('OTP verification failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/login_image.png', // Ganti dengan gambar login
                height: 200,
              ),
              SizedBox(height: 16),
              Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              if (isOtpSent) // Tampilkan input OTP hanya setelah login
                TextField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (isOtpSent) {
                    verifyOtp(); // Verifikasi OTP
                  } else {
                    login(); // Login dan kirim OTP
                  }
                },
                child: Text(isOtpSent ? 'Verify OTP' : 'Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Or'),
              TextButton(
                onPressed: () {
                  // Navigasi ke halaman Register
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
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