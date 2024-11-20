5220411265_I Nyoman Darmayoga


# Pertemuan 3

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





# Pertemuan 4
# flutter_app

Proyek ini bertujuan untuk mengembangkan aplikasi Login dan Dashboard yang memudahkan pengguna untuk mengakses informasi makanan setelah berhasil masuk ke sistem. Aplikasi ini dirancang dengan mudah digunakan dan sederhana, memberikan pengalaman autentikasi yang lancar serta navigasi yang jelas.
Pada halaman Login, pengguna diharuskan memasukkan email dan kata sandi untuk mengakses aplikasi. Jika kata sandi terlupa, aplikasi menyediakan opsi "Forgot Password" yang memungkinkan pengguna untuk mereset kata sandi mereka. Keamanan menjadi prioritas dalam proses autentikasi ini, memastikan hanya pengguna yang terverifikasi yang dapat mengakses Dashboard.

Setelah login berhasil, pengguna akan diarahkan ke halaman Dashboard yang menampilkan berbagai menu makanan. Dashboard ini menyapa pengguna secara personal menggunakan nama mereka, menampilkan gambar makanan beserta harga yang ditawarkan. Desain yang rapi dan informatif memudahkan pengguna dalam melihat pilihan makanan yang tersedia dengan cepat.
Aplikasi ini dibangun menggunakan framework Flutter, yang memanfaatkan widget bawaan untuk menciptakan tampilan yang responsif di berbagai ukuran layar. Dengan Flutter, aplikasi ini dapat berjalan di beberapa platform seperti Android dan iOS dengan satu basis kode yang sama, membuatnya lebih efisien dalam pengembangan.


## 1. Membuat proyek flutter baru
jalankan perintah berikut pada visual studio code:

```bash
shift+>
new project
application or empty (pilih salah satu)
lalu simpan folder dan beri nama project yang dibuat
```

## 2. Membuat desain tampilan pengguna
buat folder baru di dalam folder project flutter_app dan beri nama assets, di dalam assets berisi folder images, yang berisi gambar untuk tampilan aplikasi pengguna.

## 3. Pengguna diarahkan ke halaman login saat mereka pertama kali membuaka aplikasi, lalu mereka dapat melakukan navigasi ke halaman dashboard dan dapat memilih menu makanan yang akan di beli.
Buka file lib/main.dart dan ganti kode yang ada dengan code yang sudah di buat berikut ini:
```bash
import 'package:flutter/material.dart';
import 'login.dart'; // Import LoginScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login & Dashboard App',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Menambahkan tema utama
      ),
      home: LoginScreen(), // Menampilkan login screen sebagai tampilan awal
    );
  }
}
```

## 4. Menampilkan dan mengatasi fungsionalitas halaman login di aplikasi. Pada halaman ini, pengguna diminta untuk memasukkan email dan password untuk mengakses aplikasi. 
Buka file lib/login.dart dan ganti kode yang ada dengan kode yang sudah di buat berikut ini:
```bash
import 'package:flutter/material.dart';
import 'dashboard.dart'; // Import Dashboard untuk navigasi setelah login

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Menambahkan FocusNode untuk email dan password
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // Membersihkan focus nodes
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0, // Menghilangkan bayangan AppBar
      ),
      resizeToAvoidBottomInset: true, // Menangani keyboard yang muncul
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gambar di bagian atas
              Image.asset(
                'assets/images/login_image.png', // Ganti dengan path gambar yang sesuai
                height: 200,
              ),
              SizedBox(height: 16),
              // Label Login
              Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // TextField untuk Email
              TextField(
                focusNode: _emailFocusNode, // Fokus untuk Email
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  // Pindahkan fokus ke kolom Password ketika email diisi
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
              ),
              SizedBox(height: 16),
              // TextField untuk Password
              TextField(
                focusNode: _passwordFocusNode, // Fokus untuk Password
                obscureText: true, // Password di-hidden
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Tambahkan aksi untuk lupa password
                  },
                  child: Text('Forgot Password?'),
                ),
              ),
              SizedBox(height: 16),
              // Tombol Login
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke dashboard ketika login sukses
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, // Warna tombol kuning
                  minimumSize: Size(double.infinity, 50), // Full width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Membuat sudut melengkung
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Teks Or dan Register
              Text('Or'),
              TextButton(
                onPressed: () {
                  // Tambahkan aksi untuk register
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## 5. Menampilkan halaman Dashboard setelah pengguna berhasil login. Pada halaman ini, mereka diberikan informasi terkait makanan yang tersedia, lengkap dengan gambar dan harga.
Buka file lib/dashboard.dart dan ganti kode yang ada dengan kode yang sudah di buat berikut ini:
```bash
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Aksi ketika tombol logout ditekan, kembali ke halaman login
              Navigator.pop(context);
            },
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
                    backgroundImage: AssetImage('assets/images/avatar.png'), // Avatar
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, I Nyoman Darmayoga',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Selamat Pagi.',
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
                  'assets/images/food_image.png', // Gambar makanan utama
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
                  FoodItem(
                    imagePath: 'assets/images/noodle.png',
                    foodName: 'Noodle',
                    price: 'Rp23.000',
                    imageSize: 100, // Menyesuaikan ukuran gambar
                  ),
                  FoodItem(
                    imagePath: 'assets/images/chicken.png',
                    foodName: 'Chicken',
                    price: 'Rp15.000',
                    imageSize: 100, // Menyesuaikan ukuran gambar
                  ),
                  FoodItem(
                    imagePath: 'assets/images/french_fries.png',
                    foodName: 'French Fries',
                    price: 'Rp11.000',
                    imageSize: 100, // Menyesuaikan ukuran gambar
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

class FoodItem extends StatelessWidget {
  final String imagePath;
  final String foodName;
  final String price;
  final double imageSize; // Tambahkan parameter untuk ukuran gambar

  const FoodItem({
    required this.imagePath,
    required this.foodName,
    required this.price,
    this.imageSize = 50, // Nilai default ukuran gambar jika tidak diubah
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: imageSize, // Gunakan ukuran gambar yang dapat disesuaikan
            width: imageSize,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                price,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

## 6. Untuk pengelolaan proyek Flutter, dan memastikan bahwa semua komponen proyek (dependensi, versi SDK, dan aset) sudah ditentukan dengan benar. Ini memungkinkan aplikasi berjalan secara konsisten di berbagai lingkungan pengembangan dan memastikan semua file yang diperlukan tersedia untuk diakses oleh kode aplikasi.
Buka file pubspec.yaml dan ganti kode yang ada dengan kode yang sudah di buat berikut ini:
``` bash
name: flutter_app
description: A new Flutter project for login and dashboard.

# Versi aplikasi dan kode build
version: 1.0.0+1

environment:
  sdk: ">=2.19.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

  # Package tambahan (jika diperlukan), sesuaikan dengan kebutuhan proyek
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Package tambahan untuk testing
  flutter_lints: ^2.0.0

flutter:

  uses-material-design: true

  # Daftar assets (gambar-gambar yang digunakan dalam proyek)
  assets:
    - assets/images/login_image.png
    - assets/images/avatar.png
    - assets/images/food_image.png
    - assets/images/noodle.png
    - assets/images/chicken.png
    - assets/images/french_fries.png
```

## 7. Run project
## 8. Output project yang telah di buat
![WhatsApp Image 2024-10-13 at 00 11 08](https://github.com/user-attachments/assets/5f5dcfe2-3390-473a-bbb0-fc53d9f52d41)
![WhatsApp Image 2024-10-13 at 00 13 04](https://github.com/user-attachments/assets/897fb4f7-345b-4a16-b42f-5c8e43cea122)
