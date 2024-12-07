import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dashboard.dart'; // Import Dashboard
import 'register.dart'; // Import Register
import 'forgot_password.dart'; // Import ForgotPassword

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  bool isOtpSent = false;
  bool isLoading = false;
  String? generatedOtp;

  // Fungsi untuk mengosongkan semua input
  void clearInputs() {
    _emailController.clear();
    _passwordController.clear();
    _otpController.clear();
    setState(() {
      isOtpSent = false;
    });
  }

  // Validasi input untuk login
  bool _validateInputs() {
    if (!_emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid email address')),
      );
      return false;
    }
    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password cannot be empty')),
      );
      return false;
    }
    return true;
  }

  // Fungsi untuk mengirim OTP ke WhatsApp melalui Fonnte
  Future<void> _sendOtp(String phoneNumber, String otp) async {
    final response = await http.post(
      Uri.parse('https://api.fonnte.com/send'),
      headers: {
        'Authorization': 'kxUK5VDQzNgHsz7q4MLc', // API key Fonnte
      },
      body: {
        'target': phoneNumber,
        'message': 'Your OTP code is: $otp',
        'type': 'text',
      },
    );

    if (response.statusCode == 200) {
      print('OTP sent successfully');
    } else {
      print('Failed to send OTP: ${response.body}');
    }
  }

  // Fungsi untuk menghasilkan OTP acak
  String _generateOtp() {
    final random = Random();
    return (1000 + random.nextInt(9000)).toString(); // Membuat OTP 4 digit
  }

  // Fungsi login untuk autentikasi email dan password
  Future<void> login() async {
    if (!_validateInputs()) return; // Validasi input sebelum login

    setState(() {
      isLoading = true;
    });
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (response.user != null) {
        // Mengambil nomor telepon dari database
        String? phoneNumber = await _getPhoneNumber(response.user!.id);

        if (phoneNumber != null) {
          generatedOtp = _generateOtp();
          await _sendOtp(phoneNumber, generatedOtp!);

          setState(() {
            isOtpSent = true;
          });
          print('Login successful, OTP sent');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Phone number not found.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    } catch (e) {
      print('Login failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Fungsi untuk mendapatkan nomor telepon dari database berdasarkan user_id
  Future<String?> _getPhoneNumber(String userId) async {
    final response = await Supabase.instance.client
        .from('users')
        .select('phone')
        .eq('user_id', userId)
        .maybeSingle();

    if (response != null && response['phone'] != null) {
      return response['phone'] as String?;
    } else {
      return null;
    }
  }

  // Validasi OTP
  bool _validateOtpInput() {
    if (_otpController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP cannot be empty')),
      );
      return false;
    }
    return true;
  }

  // Fungsi untuk verifikasi OTP
  Future<void> verifyOtp() async {
    if (!_validateOtpInput()) return; // Validasi input OTP sebelum verifikasi

    if (_otpController.text == generatedOtp) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(clearInputs: clearInputs),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
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
                'assets/images/login_image.png',
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to My App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text('Forgot Password?'),
                ),
              ),
              SizedBox(height: 16),
              if (isOtpSent)
                TextField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: isLoading ? null : (isOtpSent ? verifyOtp : login),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(isOtpSent ? 'Verify OTP' : 'Login'),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}