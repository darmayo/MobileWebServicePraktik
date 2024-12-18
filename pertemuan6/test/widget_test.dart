import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/main.dart'; // Sesuaikan dengan nama package Anda
import 'package:flutter/material.dart';

void main() {
  setUpAll(() async {
    // Inisialisasi SharedPreferences
    SharedPreferences.setMockInitialValues({});

    // Inisialisasi Supabase
    await Supabase.initialize(
      url: 'https://owlegltfdnlmphpkgrxj.supabase.co', // URL Supabase Anda
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im93bGVnbHRmZG5sbXBocGtncnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk4NjY0NTUsImV4cCI6MjA0NTQ0MjQ1NX0.pv9z34zDYse02LdNCcDgYfJoAAPoM8BiS6eF6yyVM04', // Anon key Anda
    );
  });

  testWidgets('LoginScreen has the required widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verifikasi elemen pada LoginScreen
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2)); // Email & Password
  });
}