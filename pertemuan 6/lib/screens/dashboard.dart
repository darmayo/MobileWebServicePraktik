import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/payment_service.dart';

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

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  // Ambil data pengguna dari Supabase
  void _fetchUserDetails() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      try {
        final response = await supabase
            .from('users')
            .select('name, email, phone')
            .eq('user_id', user.id)
            .maybeSingle();

        print("Supabase response: $response"); // Debug response
        setState(() {
          userEmail = response?['email'] ?? "default@example.com";
          userName = response?['name'] ?? "User";
          userPhone = response?['phone'] ?? "08123456789";
        });
        print("Fetched email: $userEmail"); // Debug email
      } catch (e) {
        print('Error fetching user details: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal memuat data pengguna: $e')),
        );
      }
    }
  }

  // Pesan salam berdasarkan waktu
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

  // Toggle pilihan item
  void toggleSelection(FoodItem item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  // Hitung total biaya
  int getTotalAmount() {
    return selectedItems.fold(0, (total, item) => total + item.amount);
  }

  // Buat transaksi pembayaran
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
    print('Error during transaction: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gagal membuat transaksi: ${e.toString()}')),
    );
  }
}


  // Logout
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.purple,
        actions: [
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
                        'Hallo, $userName',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        getGreetingMessage(),
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