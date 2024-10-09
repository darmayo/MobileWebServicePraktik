import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My Flutter App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Container Widget',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.star, color: Colors.blue),
                Text('Row Widget', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: <Widget>[
                Text('Column Widget', style: TextStyle(fontSize: 16)),
                Icon(Icons.star, color: Colors.blue),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Adjust based on your data
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item ${index + 1}'),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                // Handle tap gesture
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped!')),
                );
              },
              child: Container(
                color: Colors.blue,
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Text(
                    'Tap me',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle ElevatedButton press
              },
              child: Text('Elevated Button'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Handle TextButton press
              },
              child: Text('Text Button'),
            ),
            SizedBox(height: 20),
            FutureBuilder<String>(
              future: fetchData(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text('Data: ${snapshot.data}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return 'Hello from Future!';
  }
}