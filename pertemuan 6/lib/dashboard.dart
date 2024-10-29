import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase
import 'payment_service.dart';

class DashboardScreen extends StatefulWidget {
  final VoidCallback clearInputs; // Menambahkan parameter clearInputs

  DashboardScreen({required this.clearInputs});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PaymentService paymentService = PaymentService();
  final SupabaseClient supabase = Supabase.instance.client; // Instance Supabase
  List<FoodItem> selectedItems = [];
  String? userEmail; // Variabel untuk menyimpan email pengguna
  String? userName; // Variabel untuk menyimpan nama pengguna

  @override
  void initState() {
    super.initState();
    _fetchUserDetails(); // Memanggil fungsi untuk mengambil email dan nama pengguna
  }

  // Fungsi untuk mengambil email dan nama pengguna yang sedang login dari Supabase
  void _fetchUserDetails() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      final response = await supabase
          .from('users')
          .select('name')
          .eq('user_id', user.id)
          .maybeSingle();

      setState(() {
        userEmail = user.email; // Mengambil email dari objek user
        userName = response?['name'] as String? ?? "User"; // Mengambil nama dari hasil query Supabase
      });
    }
  }

  // Fungsi untuk menentukan sapaan berdasarkan waktu saat ini
  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Selamat Pagi';
    } else if (hour >= 12 && hour < 15) {
      return 'Selamat Siang';
    } else if (hour >= 15 && hour < 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }

  void toggleSelection(FoodItem item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  int getTotalAmount() {
    return selectedItems.fold(0, (total, item) => total + item.amount);
  }

  void logout() {
    widget.clearInputs(); // Memanggil fungsi untuk mengosongkan input saat logout
    Navigator.pop(context); // Kembali ke halaman login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout, // Memanggil fungsi logout saat tombol logout diklik
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
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, $userName',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        getGreetingMessage(),
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
                  'assets/images/food_image.png',
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
            if (selectedItems.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Total: Rp${getTotalAmount()}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        int totalAmount = getTotalAmount();
                        String email = userEmail ?? "default@example.com"; // Menggunakan email pengguna atau default
                        String firstName = userName?.split(" ").first ?? "User";
                        String lastName = userName?.split(" ").last ?? "Example";
                        String phone = "08123456789"; // Ganti dengan nomor telepon pengguna jika tersedia

                        try {
                          await paymentService.createTransaction(totalAmount, email, firstName, lastName, phone);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Pembayaran berhasil diproses')),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Pembayaran gagal: $e')),
                          );
                        }
                      },
                      child: Text('Lanjutkan ke Pembayaran'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: EdgeInsets.symmetric(vertical: 12),
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

// Definisi kelas FoodItem
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
      other is FoodItem &&
          runtimeType == other.runtimeType &&
          foodName == other.foodName;

  @override
  int get hashCode => foodName.hashCode;
}

// Definisi widget FoodItemWidget
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
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.foodName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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