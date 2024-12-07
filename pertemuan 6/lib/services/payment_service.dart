import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class PaymentService {
  Future<Map<String, dynamic>> createTransaction({
    required int amount,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    final url = 'https://api.sandbox.midtrans.com/v2/charge';
    final headers = {
      'Authorization': 'Basic ${base64Encode(utf8.encode("$MIDTRANS_SERVER_KEY:"))}',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "payment_type": "bank_transfer",
      "transaction_details": {
        "order_id": "order-${DateTime.now().millisecondsSinceEpoch}",
        "gross_amount": amount,
      },
      "customer_details": {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
      },
      "bank_transfer": {
        "bank": "bca",
      }
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      print('Midtrans Response Status: ${response.statusCode}');
      print('Midtrans Response Body: ${response.body}');

      if (response.statusCode == 201 || response.statusCode == 200) {
      // Log saat transaksi sukses
       print('Transaksi berhasil: ${response.body}');
        return jsonDecode(response.body); // Kembalikan respons sukses
      } else {
       // Log saat transaksi gagal
        final errorResponse = jsonDecode(response.body);
        final errorMessage = errorResponse['status_message'] ?? 'Unknown error';
        print('Transaksi gagal: $errorMessage');
         throw Exception('Gagal membuat transaksi: $errorMessage');
      }     

    } catch (e) {
      print('Error saat membuat transaksi: $e');
      throw Exception('Terjadi kesalahan saat memproses transaksi. Detail: $e');
    }
  }
}