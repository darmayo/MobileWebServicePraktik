# Mobile---Web-Service-Praktik


Proyek ini bertujuan untuk mengembangkan aplikasi kalkulator Body Mass Index (BMI) yang berfungsi sebagai alat bantu bagi individu dalam memantau status kesehatan mereka. BMI merupakan metode yang umum digunakan untuk menilai proporsi berat badan terhadap tinggi badan, sehingga membantu dalam menentukan apakah seseorang berada dalam kategori berat badan yang sehat, kurang, atau berlebih. Aplikasi yang dikembangkan menggunakan Flutter ini dirancang dengan antarmuka yang intuitif, memungkinkan pengguna untuk dengan mudah memasukkan data berat dan tinggi badan mereka. Setelah data dimasukkan, aplikasi secara otomatis menghitung nilai BMI dan memberikan interpretasi serta saran yang sesuai. Dengan adanya aplikasi ini, diharapkan pengguna dapat lebih sadar akan pentingnya menjaga berat badan yang sehat dan dapat mengambil langkah-langkah yang diperlukan untuk meningkatkan kesehatan mereka.

Setelah memahami tujuan dan fitur utama dari aplikasi kalkulator BMI ini, langkah selanjutnya adalah melihat implementasi teknis dari proyek tersebut. Di bagian berikut, akan dijelaskan bagaimana kode aplikasi dirancang dan dibangun menggunakan Flutter, termasuk struktur utama, komponen yang digunakan, serta logika perhitungan BMI yang diimplementasikan.

# Tutorial Membuat Aplikasi BMI Menggunakan Flutter

## 1. Instal Flutter
Pastikan Anda telah menginstal Flutter SDK di komputer Anda. Ikuti [dokumentasi resmi Flutter](https://flutter.dev/docs/get-started/install) untuk instalasi.

## 2. Buat Proyek Flutter Baru
Jalankan perintah berikut ini di terminal Anda:

```bash
flutter create bmi_calculator
cd bmi_calculator
```

## 3. Buat membuat desain tampilan pengguna
Buka file lib/main.dart dan ganti kode yang ada dengan kode berikut:
```bash
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

```

## 4. Menjalankan aplikasi dengan mengunakan perintah berikut di terminal
```bash
flutter run
```

## 5. Output codingan
![WhatsApp Image 2024-10-09 at 00 08 21](https://github.com/user-attachments/assets/f0728118-0f36-4508-baeb-9d851feb5e71)

## 6. Analisis output dan solusi
dari output diatas terdapat kesalahan perhitungan BMI. Seharusnya perhitungan BMI yang benar adalah berikut:
BMI < 18.5: "Kurus"
BMI 18.5 - 24.9: "Normal"
BMI 25.0 - 29.9: "Kegemukan"
BMI ≥ 30.0: "Obesitas"

Namun, Dalam kode diatas terdapat kesalahan sehingga hasilnya terbalik, letak kesalahannya adalah:

BMI < 18.5 menjadi "Obesitas"
BMI 18.5 - 24.9 menjadi "Kegemukan"
BMI 25.0 - 29.9 menjadi "Normal"
BMI ≥ 30.0 menjadi "Kurus"

oleh karena itu saya mengubah urutan dan logika kondisi untuk mencerminkan definisi BMI yang benar.

pada codingan diatas code memeriksa input tinggi dan berat dengan benar, tetapi tidak mengatur nilai bmi ke null jika input tidak valid. Ini menyebabkan nilai lama tetap ada ketika pengguna mencoba menghitung BMI setelah memasukkan input yang tidak valid. Oleh karena itu, saya harus memastikan untuk mengatur bmi ke null saat input tidak valid, sehingga hasil sebelumnya tidak ditampilkan.

## 7. Perbaikan codingan berdasarkan analisis
```bash
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

    if (tinggi > 0 && berat > 0) { // Memeriksa kedua input
      setState(() {
        bmi = berat / (tinggi * tinggi);
        bmi = double.parse(bmi!.toStringAsFixed(2)); // Pembulatan 2 desimal
        if (bmi! < 18.5) {
          hasil = "Kurus";
        } else if (bmi! < 24.9) {
          hasil = "Normal";
        } else if (bmi! < 29.9) {
          hasil = "Kegemukan";
        } else {
          hasil = "Obesitas";
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
        bmi = null; // Benar: BMI di-reset ke null jika input tidak valid
      });
    }
  }

  void resetForm() {
    tinggiController.clear();
    beratController.clear();
    setState(() {
      bmi = null; // Benar: BMI di-reset ke null
      hasil = ""; // Pesan hasil di-reset
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
            if (bmi != null) // Benar: BMI hanya ditampilkan jika sudah dihitung
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
```

## 8. Output codingan
![WhatsApp Image 2024-10-09 at 00 10 22](https://github.com/user-attachments/assets/6ddced09-44d5-4505-b4ea-3eb83edffb36)


