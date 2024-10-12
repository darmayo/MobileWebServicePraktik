import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/login_image.png', height: 200),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen(username: _usernameController.text)),
                  );
                }
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final String username;

  MenuScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Pagi, $username'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hallo, $username\nSelamat Pagi.',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Image.asset('assets/food_banner.png', height: 200),
          SizedBox(height: 20),
          ListTile(
            leading: Image.asset('assets/noodle.png', height: 50),
            title: Text('Noodle'),
            subtitle: Text('Rp23.000'),
          ),
          ListTile(
            leading: Image.asset('assets/chicken.png', height: 50),
            title: Text('Chicken'),
            subtitle: Text('Rp15.000'),
          ),
          ListTile(
            leading: Image.asset('assets/french_fries.png', height: 50),
            title: Text('French Fries'),
            subtitle: Text('Rp11.000'),
          ),
        ],
      ),
    );
  }
}
