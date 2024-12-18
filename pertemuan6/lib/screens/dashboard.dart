import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/payment_service.dart';
import '../utils/theme_manager.dart'; // Mengimpor themeNotifier untuk Dark Mode

class DashboardScreen extends StatefulWidget {
  final VoidCallback clearInputs;

  DashboardScreen({required this.clearInputs});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PaymentService paymentService = PaymentService();
  final SupabaseClient supabase = Supabase.instance.client;

  List<FoodItem> selectedItems = [];
  String? userEmail;
  String? userName;
  String? userPhone;
  String paymentInstructions = '';
  String greetingMessage = ''; // State untuk salam
  bool isDarkMode = false; // State lokal untuk Dark Mode

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
    _updateGreetingMessage();
    _startRealTimeGreeting();
  }

  // Mengambil data pengguna dari Supabase
  void _fetchUserDetails() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      try {
        final response = await supabase
            .from('users')
            .select('name, email, phone')
            .eq('user_id', user.id)
            .maybeSingle();

        setState(() {
          userEmail = response?['email'] ?? "default@example.com";
          userName = response?['name'] ?? "User";
          userPhone = response?['phone'] ?? "08123456789";
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal memuat data pengguna: $e')),
        );
      }
    }
  }

  // Perbarui salam berdasarkan waktu
  void _updateGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      greetingMessage = 'Selamat Pagi';
    } else if (hour >= 12 && hour < 15) {
      greetingMessage = 'Selamat Siang';
    } else if (hour >= 15 && hour < 18) {
      greetingMessage = 'Selamat Sore';
    } else {
      greetingMessage = 'Selamat Malam';
    }
  }

  // Jalankan timer untuk memperbarui salam secara real-time
  void _startRealTimeGreeting() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _updateGreetingMessage();
        });
        _startRealTimeGreeting();
      }
    });
  }

  // Toggle pilihan item makanan
  void toggleSelection(FoodItem item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  // Hitung total harga makanan yang dipilih
  int getTotalAmount() {
    return selectedItems.fold(0, (total, item) => total + item.amount);
  }

  // Membuat transaksi pembayaran
  Future<void> makePayment() async {
    try {
      if (userEmail == null || userName == null) {
        throw Exception('Data pengguna tidak lengkap. Silakan periksa akun Anda.');
      }

      int totalAmount = getTotalAmount();
      String email = userEmail!;
      String firstName = userName!.split(" ").first;
      String lastName = userName!.split(" ").last;
      String phone = userPhone ?? "08123456789";

      final response = await paymentService.createTransaction(
        amount: totalAmount,
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
      );

      if (response.containsKey('va_numbers')) {
        final vaNumbers = response['va_numbers'][0];
        final bank = vaNumbers['bank'];
        final vaNumber = vaNumbers['va_number'];

        setState(() {
          paymentInstructions =
              'Transfer ke Bank $bank\nNomor Virtual Account: $vaNumber\nJumlah: Rp$totalAmount';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Transaksi berhasil dibuat! Silakan lakukan pembayaran.')),
        );
      } else {
        throw Exception('Transaksi gagal. Respons tidak valid.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal membuat transaksi: ${e.toString()}')),
      );
    }
  }

  // Logout pengguna
  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
      widget.clearInputs();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout berhasil')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout gagal: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: () {
              setState(() {
                themeNotifier.value =
                    isDarkMode ? ThemeMode.light : ThemeMode.dark;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
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
                        'Hallo, ${userName ?? "User"}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        greetingMessage,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      onPressed: makePayment,
                      child: Text('Lanjutkan ke Pembayaran'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                    if (paymentInstructions.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          paymentInstructions,
                          style: TextStyle(fontSize: 16),
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

// Model untuk Item
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