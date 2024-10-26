import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // Fungsi untuk login dan mengirim OTP
  Future<bool> login(String email, String password) async {
    final url = Uri.parse('https://example.com/api/login'); // Ganti dengan URL API login kamu

    final response = await http.post(
      url,
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Jika login sukses, misalnya API mengirimkan OTP
      return true;
    } else {
      // Jika login gagal
      return false;
    }
  }

  // Fungsi untuk memverifikasi OTP
  Future<bool> verifyOTP(String otp) async {
    final url = Uri.parse('https://example.com/api/verify-otp'); // Ganti dengan URL API verifikasi OTP kamu

    final response = await http.post(
      url,
      body: jsonEncode({'otp': otp}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // OTP valid
      return true;
    } else {
      // OTP tidak valid
      return false;
    }
  }
}
