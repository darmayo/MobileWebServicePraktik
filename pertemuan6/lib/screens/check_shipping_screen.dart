import 'package:flutter/material.dart';
import '../services/shipping_service.dart';

class CheckShippingScreen extends StatefulWidget {
  @override
  _CheckShippingScreenState createState() => _CheckShippingScreenState();
}

class _CheckShippingScreenState extends State<CheckShippingScreen> {
  final RajaOngkirService rajaOngkirService = RajaOngkirService();

  List<Map<String, dynamic>> provinces = [];
  List<Map<String, dynamic>> citiesOrigin = [];
  List<Map<String, dynamic>> citiesDestination = [];
  List<Map<String, dynamic>> shippingResults = [];

  String? selectedProvinceOrigin;
  String? selectedCityOrigin;
  String? selectedProvinceDestination;
  String? selectedCityDestination;
  String selectedCourier = "jne"; // Default kurir: JNE

  final TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProvinces();
  }

  // Ambil daftar provinsi
  void fetchProvinces() async {
    try {
      final results = await rajaOngkirService.getProvinces();
      setState(() {
        provinces = results;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  // Ambil daftar kota berdasarkan ID provinsi
  void fetchCities(String provinceId, bool isOrigin) async {
    try {
      final results = await rajaOngkirService.getCities(provinceId: provinceId);
      setState(() {
        if (isOrigin) {
          citiesOrigin = results;
        } else {
          citiesDestination = results;
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  // Hitung ongkir
  void checkShippingCost() async {
    try {
      if (selectedCityOrigin == null ||
          selectedCityDestination == null ||
          weightController.text.isEmpty ||
          int.tryParse(weightController.text) == null ||
          int.parse(weightController.text) <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Harap lengkapi semua data dengan benar")),
        );
        return;
      }

      final results = await rajaOngkirService.getShippingCost(
        origin: selectedCityOrigin!,
        destination: selectedCityDestination!,
        weight: int.parse(weightController.text),
        courier: selectedCourier,
      );

      setState(() {
        shippingResults = results;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cek Ongkir"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String>(
                value: selectedProvinceOrigin,
                hint: Text("Pilih Provinsi Asal"),
                items: provinces.map<DropdownMenuItem<String>>((province) {
                  return DropdownMenuItem<String>(
                    value: province['province_id'].toString(),
                    child: Text(province['province']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedProvinceOrigin = value;
                    selectedCityOrigin = null; // Reset kota asal
                    fetchCities(value!, true);
                  });
                },
              ),
              if (citiesOrigin.isNotEmpty)
                DropdownButton<String>(
                  value: selectedCityOrigin,
                  hint: Text("Pilih Kota Asal"),
                  items: citiesOrigin.map<DropdownMenuItem<String>>((city) {
                    return DropdownMenuItem<String>(
                      value: city['city_id'].toString(),
                      child: Text(city['city_name']),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCityOrigin = value;
                    });
                  },
                ),
              DropdownButton<String>(
                value: selectedProvinceDestination,
                hint: Text("Pilih Provinsi Tujuan"),
                items: provinces.map<DropdownMenuItem<String>>((province) {
                  return DropdownMenuItem<String>(
                    value: province['province_id'].toString(),
                    child: Text(province['province']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedProvinceDestination = value;
                    selectedCityDestination = null; // Reset kota tujuan
                    fetchCities(value!, false);
                  });
                },
              ),
              if (citiesDestination.isNotEmpty)
                DropdownButton<String>(
                  value: selectedCityDestination,
                  hint: Text("Pilih Kota Tujuan"),
                  items: citiesDestination.map<DropdownMenuItem<String>>((city) {
                    return DropdownMenuItem<String>(
                      value: city['city_id'].toString(),
                      child: Text(city['city_name']),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCityDestination = value;
                    });
                  },
                ),
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  labelText: "Berat Barang (gram)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              DropdownButton<String>(
                value: selectedCourier,
                items: [
                  DropdownMenuItem(child: Text("JNE"), value: "jne"),
                  DropdownMenuItem(child: Text("TIKI"), value: "tiki"),
                  DropdownMenuItem(child: Text("POS"), value: "pos"),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCourier = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: checkShippingCost,
                  child: Text("Cek Ongkir"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (shippingResults.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: shippingResults.length,
                  itemBuilder: (context, index) {
                    final result = shippingResults[index];
                    return Card(
                      child: ListTile(
                        title: Text(result['service']),
                        subtitle: Text("Harga: Rp${result['cost'][0]['value']}"),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
