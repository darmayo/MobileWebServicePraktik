import 'dart:convert';
import 'package:http/http.dart' as http;

class PaymentService {
  final String serverKey = 'SB-Mid-server-TQgYv4K0-Q4CEx4jsgaKJEkI'; // Ganti dengan server key Sandbox Anda

  Future<void> createTransaction(int amount, String email, String firstName, String lastName, String phone) async {
    final url = 'https://api.sandbox.midtrans.com/v2/charge';

    final headers = {
      'Authorization': 'Basic ${base64Encode(utf8.encode("$serverKey:"))}',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "payment_type": "bank_transfer",
      "transaction_details": {
        "order_id": "order-${DateTime.now().millisecondsSinceEpoch}",
        "gross_amount": amount,
      },
      "customer_details": {
        "email": email, // Email pengguna
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone
      },
      "bank_transfer": {
        "bank": "btpn",
      }
    });

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      print('Transaction created successfully: $data');
      // Tampilkan pesan sukses di sini atau gunakan data untuk notifikasi pengguna
    } else {
      print('Failed to create transaction: ${response.body}');
      // Tampilkan pesan error di sini
    }
  }
}