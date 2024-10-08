import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Kalkulator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController beratController = TextEditingController();
  double? bmi;
  String hasil = "";

  void hitungBMI() {
    double tinggi = double.tryParse(tinggiController.text) ?? 0;
    double berat = double.tryParse(beratController.text) ?? 0;

    // Mengubah logika perhitungan BMI agar menghasilkan output yang salah
    if (tinggi > 0 && berat > 0) {
      setState(() {
        bmi = berat / (tinggi * tinggi); // Benar: Menggunakan tinggi * tinggi
        bmi = double.parse(bmi!.toStringAsFixed(2));
        if (bmi! < 18.5) {
          hasil = "Obesitas"; // Salah: Mengubah hasil menjadi "Obesitas"
        } else if (bmi! < 24.9) {
          hasil = "Kegemukan"; // Salah: Mengubah hasil menjadi "Kegemukan"
        } else if (bmi! < 29.9) {
          hasil = "Normal"; // Salah: Mengubah hasil menjadi "Normal"
        } else {
          hasil = "Kurus"; // Salah: Mengubah hasil menjadi "Kurus"
        }
      });
    } else {
      setState(() {
        if (tinggi <= 0) {
          hasil = "Tinggi tidak valid!";
        } else if (berat <= 0) {
          hasil = "Berat tidak valid!";
        } else {
          hasil = "Masukkan tinggi dan berat yang valid!";
        }
        bmi = null;
      });
    }
  }

  void resetForm() {
    tinggiController.clear();
    beratController.clear();
    setState(() {
      bmi = null;
      hasil = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator BMI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi (meter)'),
            ),
            TextField(
              controller: beratController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Berat (kg)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungBMI,
              child: Text('Hitung BMI'),
            ),
            ElevatedButton(
              onPressed: resetForm,
              child: Text('Reset'),
            ),
            SizedBox(height: 20),
            if (bmi != null)
              Text(
                'BMI Kamu: ${bmi!.toString()}',
                style: TextStyle(fontSize: 24),
              ),
            SizedBox(height: 10),
            Text(
              hasil,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}