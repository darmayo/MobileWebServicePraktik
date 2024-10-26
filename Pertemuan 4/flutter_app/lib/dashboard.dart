import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Aksi ketika tombol logout ditekan, kembali ke halaman login
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/avatar.png'), // Avatar
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, I Nyoman Darmayoga',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Selamat Pagi.',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/food_image.png', // Gambar makanan utama
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodItem(
                    imagePath: 'assets/images/noodle.png',
                    foodName: 'Noodle',
                    price: 'Rp23.000',
                    imageSize: 100, // Menyesuaikan ukuran gambar
                  ),
                  FoodItem(
                    imagePath: 'assets/images/chicken.png',
                    foodName: 'Chicken',
                    price: 'Rp15.000',
                    imageSize: 100, // Menyesuaikan ukuran gambar
                  ),
                  FoodItem(
                    imagePath: 'assets/images/french_fries.png',
                    foodName: 'French Fries',
                    price: 'Rp11.000',
                    imageSize: 100, // Menyesuaikan ukuran gambar
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String imagePath;
  final String foodName;
  final String price;
  final double imageSize; // Tambahkan parameter untuk ukuran gambar

  const FoodItem({
    required this.imagePath,
    required this.foodName,
    required this.price,
    this.imageSize = 50, // Nilai default ukuran gambar jika tidak diubah
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: imageSize, // Gunakan ukuran gambar yang dapat disesuaikan
            width: imageSize,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                price,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}