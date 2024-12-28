import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/login.dart';
import 'screens/dashboard.dart';
import 'screens/user_list.dart';
import 'screens/edit_user_screen.dart';
import 'screens/check_shipping_screen.dart';
import 'screens/profile_edit_screen.dart';
import 'screens/change_password_screen.dart';
import 'utils/constants.dart';
import 'utils/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Supabase.initialize(
      url: 'https://owlegltfdnlmphpkgrxj.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im93bGVnbHRmZG5sbXBocGtncnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk4NjY0NTUsImV4cCI6MjA0NTQ0MjQ1NX0.pv9z34zDYse02LdNCcDgYfJoAAPoM8BiS6eF6yyVM04',
    );
    print("Supabase initialized successfully");
  } catch (e) {
    print('Error initializing Supabase: $e');
    runApp(ErrorApp(errorMessage: 'Error initializing Supabase: $e'));
    return;
  }

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: const MyApp(),
    ),
  );
}

class ErrorApp extends StatelessWidget {
  final String errorMessage;

  const ErrorApp({required this.errorMessage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text(errorMessage)),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Supabase App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: themeManager.themeMode,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(clearInputs: () {}),
        '/userList': (context) => UserListScreen(),
        '/editUser': (context) => EditUserScreen(),
        '/checkShipping': (context) => CheckShippingScreen(),
        '/editProfile': (context) {
          final routeData = ModalRoute.of(context);
          final arguments = routeData?.settings.arguments as Map<String, dynamic>? ?? {};
          print('Arguments for EditProfileScreen: $arguments'); // Debug Log
          return EditProfileScreen(userData: arguments);
        },
        '/changePassword': (context) => ChangePasswordScreen(),
      },
    );
  }
}