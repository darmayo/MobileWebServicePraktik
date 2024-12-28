import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class PaymentService {
  /// Fungsi untuk membuat transaksi baru menggunakan Midtrans
  Future<Map<String, dynamic>> createTransaction({
    required int amount,
    required String email,
    required String firstName,
    String? lastName, // Membuat lastName opsional
    required String phone,
    String paymentType = 'bank_transfer',
  }) async {
    final url = 'https://api.sandbox.midtrans.com/v2/charge'; // URL Midtrans sandbox
    final headers = {
      'Authorization': 'Basic ${base64Encode(utf8.encode("$MIDTRANS_SERVER_KEY:"))}', // API Key Midtrans
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "payment_type": paymentType,
      "transaction_details": {
        "order_id": "order-${DateTime.now().millisecondsSinceEpoch}", // Unique order_id
        "gross_amount": amount, // Jumlah transaksi
      },
      "customer_details": {
        "email": email, // Email pelanggan
        "first_name": firstName, // Nama depan pelanggan
        if (lastName != null) "last_name": lastName, // Nama belakang opsional
        "phone": phone, // Nomor telepon pelanggan
      },
      if (paymentType == "bank_transfer") ...{
        "bank_transfer": {"bank": "bca"}, // Opsi transfer bank
      },
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Jika transaksi berhasil
        return jsonDecode(response.body);
      } else {
        // Jika transaksi gagal
        final errorResponse = jsonDecode(response.body);
        throw Exception('Gagal membuat transaksi: ${errorResponse['status_message']}');
      }
    } catch (e) {
      // Penanganan error
      throw Exception('Terjadi kesalahan saat memproses transaksi: $e');
    }
  }
}