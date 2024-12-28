import 'dart:convert';
import 'package:http/http.dart' as http;

class RajaOngkirService {
  final String apiKey = "cfd779036f3b1a6d93ba4e639f9c2e08"; // API Key Anda

  // Fungsi untuk mendapatkan daftar provinsi
  Future<List<Map<String, dynamic>>> getProvinces() async {
    final url = Uri.parse("https://api.rajaongkir.com/starter/province");

    final response = await http.get(
      url,
      headers: {"key": apiKey},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['rajaongkir']['results']);
    } else {
      throw Exception("Gagal mengambil daftar provinsi: ${response.body}");
    }
  }

  // Fungsi untuk mendapatkan daftar kota berdasarkan ID provinsi
  Future<List<Map<String, dynamic>>> getCities({required String provinceId}) async {
    final url = Uri.parse("https://api.rajaongkir.com/starter/city?province=$provinceId");

    final response = await http.get(
      url,
      headers: {"key": apiKey},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['rajaongkir']['results']);
    } else {
      throw Exception("Gagal mengambil daftar kota: ${response.body}");
    }
  }

  // Fungsi untuk menghitung ongkos kirim
  Future<List<Map<String, dynamic>>> getShippingCost({
    required String origin,
    required String destination,
    required int weight,
    required String courier,
  }) async {
    final url = Uri.parse("https://api.rajaongkir.com/starter/cost");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "key": apiKey,
      },
      body: jsonEncode({
        "origin": origin,
        "destination": destination,
        "weight": weight,
        "courier": courier,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['rajaongkir']['results'][0]['costs']);
    } else {
      throw Exception("Gagal mendapatkan ongkir: ${response.body}");
    }
  }
}
