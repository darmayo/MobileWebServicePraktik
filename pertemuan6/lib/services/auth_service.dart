import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<AuthResponse> login(String email, String password) async {
    try {
      return await supabase.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      print('Login error: $e');
      throw Exception('Gagal login. Silakan periksa email dan password Anda.');
    }
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      print('Logout error: $e');
      throw Exception('Gagal logout. Silakan coba lagi.');
    }
  }

  Future<void> sendResetPasswordLink(String email) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
    } catch (e) {
      print('Reset password error: $e');
      throw Exception('Gagal mengirim tautan reset password: ${e.toString()}');
    }
  }
}