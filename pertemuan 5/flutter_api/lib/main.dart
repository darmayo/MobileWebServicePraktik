import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login.dart'; // Import login screen Anda

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://owlegltfdnlmphpkgrxj.supabase.co', // Ganti dengan URL Supabase Anda
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im93bGVnbHRmZG5sbXBocGtncnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk4NjY0NTUsImV4cCI6MjA0NTQ0MjQ1NX0.pv9z34zDYse02LdNCcDgYfJoAAPoM8BiS6eF6yyVM04', // Ganti dengan Anon Key Supabase Anda
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supabase Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(), // Halaman login sebagai halaman awal
    );
  }
}
