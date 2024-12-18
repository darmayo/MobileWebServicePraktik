import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/login.dart';
import 'screens/dashboard.dart'; // Pastikan dashboard.dart diimport
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Inisialisasi Supabase
    await Supabase.initialize(
      url: SUPABASE_URL,
      anonKey: SUPABASE_ANON_KEY,
    );

    // Debugging untuk memastikan Supabase berhasil diinisialisasi
    print("Supabase initialized successfully");
    print("Supabase URL: $SUPABASE_URL");
  } catch (e) {
    print('Error initializing Supabase: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Flutter dengan Supabase dan Midtrans',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Rute awal aplikasi
      routes: {
        '/': (context) => LoginScreen(), // Halaman login
        '/dashboard': (context) => DashboardScreen(
              clearInputs: () {
                print("Inputs cleared on logout");
              },
            ), // Halaman dashboard
      },
    );
  }
}