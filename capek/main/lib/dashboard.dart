import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Product 1',
      description: 'This is the first product',
      imageUrl: 'https://picsum.photos/id/1074/400/400',
    ),
    Product(
      name: 'Product 2',
      description: 'This is the second product',
      imageUrl: 'https://picsum.photos/id/1084/400/400',
    ),
    Product(
      name: 'Product 3',
      description: 'This is the second product',
      imageUrl: 'https://picsum.photos/id/1084/400/400',
    ),
    Product(
      name: 'Product 4',
      description: 'This is the second product',
      imageUrl: 'https://picsum.photos/id/1084/400/400',
    ),
    Product(
      name: 'Product 5',
      description: 'This is the second product',
      imageUrl: 'https://picsum.photos/id/1084/400/400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/id/1005/400/400'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ahmad Sulaeman',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Good Morning',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Image.network(
              'https://picsum.photos/id/1011/800/200',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        product.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.name),
                      subtitle: Text(product.description),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String imageUrl;

  Product(
      {required this.name, required this.description, required this.imageUrl});
}