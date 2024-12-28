import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/theme_manager.dart';

class DashboardScreen extends StatefulWidget {
  final VoidCallback clearInputs;

  DashboardScreen({required this.clearInputs});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final SupabaseClient supabase = Supabase.instance.client;

  String? userEmail;
  String? userName;
  String? userPhone;
  String greetingMessage = '';
  List<FoodItem> selectedItems = [];

  @override
  void initState() {
    super.initState();
    tzdata.initializeTimeZones();
    _fetchUserDetails();
    _updateGreetingMessage();
  }

  // Ambil detail pengguna dari database
void _fetchUserDetails() async {
  final user = supabase.auth.currentUser;
  if (user != null) {
    try {
      final response = await supabase
          .from('users')
          .select('name, email, phone')
          .eq('user_id', user.id)
          .maybeSingle();

      if (response != null) {
        setState(() {
          userEmail = response['email'] ?? "default@example.com";
          userName = response['name'] ?? "User";
          userPhone = response['phone'] ?? "08123456789";
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data pengguna tidak ditemukan.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat detail pengguna: $e')),
      );
    }
  }
}

  // Perbarui ucapan berdasarkan waktu
  void _updateGreetingMessage() {
    final location = tz.getLocation('Asia/Jakarta');
    final now = tz.TZDateTime.now(location);
    print('Waktu lokal (Asia/Jakarta): $now');

    final hour = now.hour;
    setState(() {
      if (hour >= 5 && hour < 12) {
        greetingMessage = 'Selamat Pagi';
      } else if (hour >= 12 && hour < 15) {
        greetingMessage = 'Selamat Siang';
      } else if (hour >= 15 && hour < 18) {
        greetingMessage = 'Selamat Sore';
      } else {
        greetingMessage = 'Selamat Malam';
      }
    });
  }

  // Proses pembayaran dengan Midtrans
  Future<void> _processPayment() async {
    final url = Uri.parse('https://api.sandbox.midtrans.com/v2/charge');
    final serverKey = "SB-Mid-server-TQgYv4K0-Q4CEx4jsgaKJEkI"; // Ganti dengan server key Anda

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$serverKey:')),
    };

    final body = {
      "payment_type": "bank_transfer",
      "transaction_details": {
        "order_id": "order-${DateTime.now().millisecondsSinceEpoch}",
        "gross_amount": getTotalAmount(),
      },
      "bank_transfer": {
        "bank": "bca"
      },
      "customer_details": {
      "first_name": userName ?? 'Guest',
      "email": userEmail ?? 'default@example.com',
      "phone": userPhone ?? '08123456789'
      }

    };

    try {
      final response = await http.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("Payment Success: $responseData");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pembayaran berhasil diproses.')),
        );
      } else {
        print("Payment Failed: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pembayaran gagal: ${response.body}')),
        );
      }
    } catch (e) {
      print("Error processing payment: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  // Navigasi ke halaman profil
  void _navigateToProfileOptions() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileOptionsScreen(
          userName: userName ?? "User",
          userEmail: userEmail ?? "default@example.com",
        ),
      ),
    );
  }

  // Toggle pemilihan makanan
  void toggleSelection(FoodItem item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  // Hitung total harga
  int getTotalAmount() {
    return selectedItems.fold(0, (total, item) => total + item.amount);
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: themeManager.toggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await supabase.auth.signOut();
              widget.clearInputs();
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header informasi pengguna
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: _navigateToProfileOptions,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tampilkan nama pengguna
                        Text(
                          'Hallo, ${userName ?? "User"}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        // Tampilkan ucapan waktu
                        Text(
                          greetingMessage,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Banner gambar makanan
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/food_image.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Daftar makanan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  FoodItemWidget(
                    item: FoodItem(
                      imagePath: 'assets/images/noodle.png',
                      foodName: 'Noodle',
                      price: 'Rp23.000',
                      amount: 23000,
                    ),
                    isSelected: selectedItems.contains(FoodItem(
                      imagePath: 'assets/images/noodle.png',
                      foodName: 'Noodle',
                      price: 'Rp23.000',
                      amount: 23000,
                    )),
                    onSelect: toggleSelection,
                  ),
                  FoodItemWidget(
                    item: FoodItem(
                      imagePath: 'assets/images/chicken.png',
                      foodName: 'Chicken',
                      price: 'Rp15.000',
                      amount: 15000,
                    ),
                    isSelected: selectedItems.contains(FoodItem(
                      imagePath: 'assets/images/chicken.png',
                      foodName: 'Chicken',
                      price: 'Rp15.000',
                      amount: 15000,
                    )),
                    onSelect: toggleSelection,
                  ),
                  FoodItemWidget(
                    item: FoodItem(
                      imagePath: 'assets/images/french_fries.png',
                      foodName: 'French Fries',
                      price: 'Rp11.000',
                      amount: 11000,
                    ),
                    isSelected: selectedItems.contains(FoodItem(
                      imagePath: 'assets/images/french_fries.png',
                      foodName: 'French Fries',
                      price: 'Rp11.000',
                      amount: 11000,
                    )),
                    onSelect: toggleSelection,
                  ),
                ],
              ),
            ),
            // Total harga
            if (selectedItems.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Total: Rp${getTotalAmount()}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _processPayment,
                      child: const Text('Lanjutkan ke Pembayaran'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
            // Tombol Cek Ongkir dan Daftar Pengguna
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkShipping');
                    },
                    child: const Text('Cek Ongkir'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/userList');
                    },
                    child: const Text('Daftar Pengguna'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
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

class FoodItem {
  final String imagePath;
  final String foodName;
  final String price;
  final int amount;

  const FoodItem({
    required this.imagePath,
    required this.foodName,
    required this.price,
    required this.amount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodItem && runtimeType == other.runtimeType && foodName == other.foodName;

  @override
  int get hashCode => foodName.hashCode;
}

class FoodItemWidget extends StatelessWidget {
  final FoodItem item;
  final bool isSelected;
  final Function(FoodItem) onSelect;

  const FoodItemWidget({
    required this.item,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            item.imagePath,
            height: 100,
            width: 100,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.foodName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  item.price,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Checkbox(
            value: isSelected,
            onChanged: (bool? value) {
              onSelect(item);
            },
          ),
        ],
      ),
    );
  }
}

class ProfileOptionsScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  const ProfileOptionsScreen({required this.userName, required this.userEmail, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama: $userName',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Email: $userEmail',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/editProfile');
              },
              child: const Text('Edit Profil'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/changePassword');
              },
              child: const Text('Ganti Password'),
            ),
            ElevatedButton(
              onPressed: () async {
                final confirm = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Hapus Akun'),
                      content: const Text('Apakah Anda yakin ingin menghapus akun ini?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Hapus'),
                        ),
                      ],
                    );
                  },
                );

                if (confirm == true) {
                  // Logika hapus akun di sini
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Akun berhasil dihapus')),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Hapus Akun'),
            ),
          ],
        ),
      ),
    );
  }
} 