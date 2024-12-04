# Pertemuan 1

Pengertian Mobile
Mobile adalah sistem perangkat lunak yang memungkinkan pengguna bergerak bebas
menggunakan perangkat seperti PDA atau ponsel. Android dan iOS mendominasi pasar sistem
operasi mobile. Aplikasi mobile awalnya terbatas, tetapi dengan kemajuan perangkat keras,
aplikasi menjadi lebih canggih dan beragam, seperti aplikasi sosial, jual beli, navigasi, hingga
berbasis suara seperti Google Assistant. Inovasi ini terus berkembang untuk memenuhi
kebutuhan pengguna.

Smartphone: Perangkat mobile yang mengombinasikan fitur telepon dengan
kapabilitas komputasi. Smartphone dilengkapi dengan sistem operasi seperti Android atau iOS,
memungkinkan pengguna untuk menjalankan aplikasi, menelepon, mengirim pesan, browsing
internet, dan melakukan berbagai aktivitas lainnya.

Tablet: Perangkat portabel berlayar sentuh dengan ukuran lebih besar daripada
smartphone, sering digunakan untuk aktivitas seperti menonton video, membaca, atau
mengerjakan tugas produktivitas. Tablet mendukung aplikasi dan fitur yang serupa dengan
smartphone, tetapi lebih cocok untuk penggunaan yang membutuhkan layar besar.

Smartwatch: Jam tangan pintar yang berfungsi sebagai perangkat pendamping
smartphone, dapat menampilkan notifikasi, melacak aktivitas fisik, serta menjalankan aplikasi
tertentu, seperti pemantauan kesehatan.

Pengertian Web Service
Web Service adalah layanan yang berbasis web yang memungkinkan aplikasi
berkomunikasi dan bertukar data melalui internet. Layanan ini menggunakan protokol standar
seperti HTTP/HTTPS, sehingga memungkinkan berbagai sistem untuk berinteraksi satu sama
lain, biasanya melalui API (Application Programming Interface). Contoh umum web service
adalah RESTful API dan SOAP, yang digunakan untuk menghubungkan aplikasi dengan server
atau layanan lainnya.

Bahasa Pemrograman
Pemrograman Web
Bahasa Pemrograman Code Hello World
JavaScript: Bahasa pemrograman yang
digunakan untuk mengembangkan aplikasi
di perangkat mobile, desktop, serta situs web.
console.log("Hello, World!");
Python: Bahasa pemrograman yang
digunakan untuk pengkodean dinamis dan
pengembangan aplikasi berbasis web.
print("Hello, World!")
C++: Bahasa pemrograman yang sesuai
untuk membuat aplikasi baik di desktop
maupun web.
#include <iostream>
using namespace std;
int main() {
cout << "Hello, World!" << endl;
return 0;
}
AJAX: Bahasa pemrograman yang
menjadikan web lebih interaktif.
// AJAX example to print "Hello, World!" in
console
const xhr = new XMLHttpRequest();
xhr.open('GET',
'https://api.example.com/hello', true);
xhr.onload = function () {
console.log("Hello, World!");
};
xhr.send();
PHP: Bahasa pemrograman sisi server untuk
aplikasi web dinamis.
<?php
echo "Hello, World!";
?>
Golang: Bahasa pemrograman efisien untuk
pengembangan aplikasi web cepat.
package main
import "fmt"
func main() {
fmt.Println("Hello, World!")
}
Ruby: Bahasa pemrograman dengan
framework Ruby on Rails untuk aplikasi web
cepat.
puts "Hello, World!"
Pemrograman Mobile
Bahasa Pemrograman Code Hello World

Java: Bahasa pemrograman yang terkenal
untuk pengembangan aplikasi Android. Java
dihargai karena kestabilannya, kemudahan
penggunaannya, dan dukungan dari
komunitas pengembang.

public class HelloWorld {
public static void main(String[] args) {
System.out.println("Hello, World!");
}
}
Swift: Bahasa pemrograman yang terkenal
untuk membuat aplikasi iOS. Swift
diperkenalkan pada tahun 2014 dan kode
sumbernya dirilis pada tahun 2015.

print("Hello, World!")
Flutter: Software Development Kit (SDK)
yang memungkinkan pengembang untuk
membuat aplikasi mobile lintas platform,
termasuk Android, iOS, Linux, Mac,
Windows, Google Fuchsia, dan platform
web.

import 'package:flutter/material.dart';
void main() {
runApp(MaterialApp(
home: Scaffold(
appBar: AppBar(title: Text('Hello
World')),
body: Center(child: Text('Hello,
World!')),
),
));
}
Pemrograman Dekstop
Bahasa Pemrograman Code Hello World

Delphi adalah IDE (Integrated Development
Environment) dan bahasa pemrograman
yang berbasis pada Object Pascal.
Digunakan untuk mengembangkan aplikasi
desktop dan mobile dengan antarmuka grafis
yang canggih.

program HelloWorld;
begin
WriteLn('Hello, World!');
end.
Electron adalah framework open-source
yang memungkinkan pengembang membuat
aplikasi desktop menggunakan teknologi
web seperti HTML, CSS, dan JavaScript.
Framework ini memungkinkan pembuatan
aplikasi lintas platform yang dapat berjalan
di Windows, macOS, dan Linux.

const { app, BrowserWindow } =
require('electron');
app.on('ready', () => {
let win = new BrowserWindow({ width:
800, height: 600 });
win.loadURL('data:text/html;charset=utf-
8,<h1>Hello, World!</h1>');
});
Perl adalah bahasa pemrograman yang
terkenal karena kemampuannya dalam
mengolah teks dan memanipulasi data.
Sering digunakan dalam pengembangan
web, administrasi sistem, dan pemrograman
skrip, Perl memiliki sintaks yang fleksibel
dan komunitas yang aktif.
print "Hello, World!\n";
Pemrograman IOT
Bahasa Pemrograman Code Hello World
Delphi adalah IDE (Integrated Development
Environment) dan bahasa pemrograman
yang berbasis pada Object Pascal.
Digunakan untuk mengembangkan aplikasi
desktop dan mobile dengan antarmuka grafis
yang canggih.
print("Hello, World!")
Database
Relational Database: Menyimpan data dalam tabel yang saling berhubungan,
menggunakan SQL. C
NoSQL Database: Menangani data tidak terstruktur; terdiri dari Document, Key-
Value, Column-Family, dan Graph. Contoh: MongoDB.
Object-Oriented Database: Menyimpan data dalam bentuk objek, mirip dengan
pemrograman berorientasi objek. Contoh: ObjectDB.
Hierarchical Database: Menyusun data dalam struktur pohon dengan hubungan satu
orang tua ke banyak anak. Contoh: IMS.
Network Database: Memungkinkan hubungan banyak-ke-banyak dalam bentuk graf.
Contoh: IDS.
Time-Series Database: Dioptimalkan untuk data yang berubah seiring waktu. Contoh:
InfluxDB.
Spatial Database: Menyimpan dan menganalisis data geospasial. Contoh: PostGIS.
Distributed Database: Data tersebar di lokasi berbeda namun terlihat sebagai satu
sistem. Contoh: Google Spanner.
Install Flutter
https://docs.flutter.dev/get-started/install/windows/mobile

Ekstrak flutter

Setting Path

Cek flutter apakah sudah berhasil terinstall

Cek apakah flutter sudah siap di jalankan atau belum dan ternyata memiliki masalah pada
android studio yang belum terinstall

Install Android Studio
https://developer.android.com/studio?hl=id

Install sdk
https://docs.flutter.dev/get-started/install?gad_source=1&gclid=Cj0KCQjwu-
63BhC9ARIsAMMTLXQTAGrL1poNozcpfEZxsjyrnWlkZtHRW3b5H08yKTJ2DmgksJnqL
2IaAuZbEALw_wcB&gclsrc=aw.ds

Install Android studio dan sdk yang telah di download tadi, next aja saat installasi jika perlu
rubah tempat untuk menyimpannya silahkan sesuaikan

Disini sengaja saya tidak mencetang agar muncul shortcuts

Cek Kembali apakah flutter masih terdapat masalah atau tidak

Cek sdk apakah sudah berhasil terinstall

Lalu coba buat untuk menjalankannya di visual studio code

Berikut hasil jika flutter sudah berhasil terinstall
![image](https://github.com/user-attachments/assets/05af3b42-2e35-4551-9113-fc42ab46d6b9)


# Pertemuan 2

Pengertian Flutter Widget/Component
Flutter Widget adalah elemen grafis atau komponen dasar yang digunakan untuk
membuat pengguna (User Interface) di aplikasi Flutter. Segala sesuatu yang terlihat pada layar
aplikasi Flutter adalah widget. Misalnya, tombol, teks, gambar, dan bahkan struktur tata letak
seperti grid dan list semuanya adalah widget.

Widget pada Flutter bisa statis (tidak berubah) atau dinamis (berubah seiring waktu atau
input pengguna). Berdasarkan hal ini, widget dibagi menjadi dua kategori utama:

Stateless Widget: Widget yang tidak berubah selama aplikasi berjalan.
Stateful Widget: Widget yang dapat berubah saat aplikasi berjalan, bergantung pada
interaksi pengguna atau perubahan data.
Jenis-Jenis Widget
Berikut adalah jenis-jenis Widget, yaitu:

a. MaterialApp
MaterialApp adalah widget utama yang digunakan untuk memulai aplikasi
Flutter. Widget ini mengatur tampilan aplikasi berdasarkan desain material dan
menyediakan fitur penting seperti navigasi antar halaman (rute), pengaturan tema, serta
aksesibilitas. MaterialApp juga digunakan untuk seluruh struktur widget dalam
aplikasi, sehingga sangat penting untuk mengatur tampilan dan fungsionalitas aplikasi
secara menyeluruh.
b. Scaffold
Scafffold ini adalah widget tata letak yang menyediakan kerangka kerja untuk
membangun desain visual berbasis material. Widget ini mencakup fitur seperti bilah
aplikasi, laci navigasi, bilah navigasi bawah, dan tombol aksi mengambang, yang
memudahkan pembuatan antarmuka pengguna (UI) yang konsisten dan menarik secara
visual.
c. Container
Widget Container adalah widget yang fleksibel dan kuat untuk mengatur tata
letak dan gaya. Widget ini dapat menampung beberapa widget di dalamnya serta
memungkinkan pengaturan properti seperti padding, margin, dekorasi, dan perataan.
Container sering digunakan untuk membuat tata letak yang responsif dan elemen UI
yang disesuaikan.
d. Row and Column
Row dan Column adalah widget tata letak yang digunakan untuk menyusun
widget secara horizontal (Row) dan vertikal (Column). Widget ini fleksibel dan
responsif, sehingga memudahkan pembuatan tata letak UI yang lebih kompleks. Anda
juga bisa menggabungkan Row dan Column untuk menciptakan desain yang lebih
rumit.
e. ListView
ListView adalah daftar widget yang bisa digulir secara vertikal atau horizontal.
Biasanya digunakan untuk menampilkan banyak data atau konten yang dibuat secara
dinamis. ListView memiliki berbagai opsi penyesuaian, seperti arah gulir, jarak antar
item, dan pengaturan perilaku gulir.
f. GestureDetector
GestureDetector adalah widget yang sangat fleksibel yang berfungsi untuk
mendeteksi berbagai gerakan, seperti ketukan, seret, serta gerakan memperkecil dan
memperbesar. Widget ini membungkus widget lainnya dan menyediakan fungsi
callback untuk menangani berbagai jenis gerakan, sehingga memudahkan Anda
menambahkan interaktivitas ke dalam aplikasi.
g. TextField
TextField adalah widget yang digunakan untuk menerima input teks dari
pengguna. Widget ini menawarkan berbagai opsi untuk menyesuaikan penampilan,
memvalidasi input, dan memformat teks yang dimasukkan. TextField sangat penting
untuk membuat formulir dan antarmuka input pengguna dalam aplikasi Flutter.
h. Image

Image widget ini digunakan untuk menampilkan gambar dalam aplikasi Flutter.
Widget ini mendukung berbagai format gambar dan menawarkan opsi untuk mengubah
ukuran, memotong, dan menyimpan gambar dalam cache. Gambar dapat dimuat dari
sumber lokal, URL jaringan, atau dari memori.
i. RaiseButton and FlatButton
RaisedButton dan FlatButton adalah widget yang digunakan untuk membuat
tombol dengan tampilan yang berbeda. Widget ini memungkinkan Anda menyesuaikan
elemen seperti teks, warna, dan fungsi yang dipanggil saat tombol ditekan. Tombol ini
sangat penting untuk interaksi dan navigasi pengguna dalam aplikasi Flutter.
j. FutureBuilder
FutureBuilder adalah widget yang digunakan untuk memuat dan menampilkan
data secara asinkron dalam aplikasi Flutter. Widget ini memungkinkan Anda
menjalankan tugas di latar belakang dan memperbarui antarmuka pengguna (UI)
setelah data siap. FutureBuilder membuat penanganan operasi asinkron lebih mudah
dan menyediakan cara yang sederhana untuk mengelola status pemuatan.

Cara Instal Widget
Berikut langkah demi langkah untuk menginstal Flutter dan mulai menggunakan widget.

Install Flutter SDK

Download Flutter SDK dari situs resminya: Flutter SDK.
Ekstrak file zip yang sudah diunduh dan simpan di lokasi yang diinginkan di
komputermu.
Tambahkan flutter/bin ke dalam PATH environment variables di sistemmu.
Cek Instalasi Flutter

Buka terminal (Command Prompt di Windows) dan jalankan perintah: flutter doctor
Flutter akan memeriksa apakah ada dependensi yang belum terpasang, seperti Android
Studio, Xcode (untuk Mac), dan SDK lainnya yang diperlukan.
Install Editor

Kita bisa menggunakan VS Code, Android Studio, atau IntelliJ IDEA untuk
pengembangan Flutter. Pastikan sudah memasang Flutter plugin di editor pilihanmu.
Di VS Code, buka menu Extensions dan cari Flutter lalu klik install.
Install Android SDK (Opsional jika belum terpasang)

Jika Kita menggunakan Android Studio, pastikan Android SDK sudah terpasang
dengan membuka SDK Manager dari Android Studio.
Install SDK versi terbaru dan pastikan semua tools seperti Android Virtual Device
(AVD) sudah terpasang.
Tambahkan Flutter Widget

Buka file lib/main.dart di proyekmu.
Kita bisa mulai menambahkan widget dengan mengganti kode bawaan dengan yang
Kita butuhkan. Berikut adalah code yang telah saya buat sebagai contoh:
Build dan Jalankan
Jalankan aplikasi Flutter di perangkat dengan mengetikkan: flutter run
Kita juga bisa menjalankannya langsung dari editor dengan klik tombol "Play" atau
"Run".
Hasil run code yang telah saya buat adalah sebagai berikut:
![Uploading image.png…]()



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


# Pertemuan 5 dan 6
Supabase & Midtrans Integrated Flutter App

Proyek ini adalah aplikasi Flutter dengan integrasi Supabase sebagai backend untuk autentikasi pengguna dan manajemen data, serta Midtrans untuk pemrosesan pembayaran. Aplikasi ini mendukung fitur login dengan OTP, registrasi pengguna, reset password, dan pembayaran.

## Fitur
1. Login dan Logout:
Autentikasi menggunakan email dan password.
Verifikasi OTP menggunakan Fonnte.
2. Registrasi:
Menyimpan data pengguna (nama, email, nomor telepon) ke tabel Supabase.
3. Reset Password:
Mengirimkan link reset password melalui email menggunakan Supabase.
4. Dashboard:
Menampilkan sapaan berbasis waktu.
Memilih item makanan dan menghitung total biaya.
5.Pembayaran:
Mengintegrasikan Midtrans untuk pembayaran melalui transfer bank.
6. Desain Responsif:
UI yang ramah pengguna dengan tema warna utama ungu dan kuning.

## Struktur Proyek
# 1. main.dart: Titik masuk aplikasi Flutter.
   code:
   ``` 
   import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login.dart'; // Import login screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://owlegltfdnlmphpkgrxj.supabase.co', // URL Supabase 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im93bGVnbHRmZG5sbXBocGtncnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk4NjY0NTUsImV4cCI6MjA0NTQ0MjQ1NX0.pv9z34zDYse02LdNCcDgYfJoAAPoM8BiS6eF6yyVM04', // Ganti dengan Anon Key Supabase Anda
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supabase Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(), // Halaman login sebagai halaman awal
    );
  }
}
```
# 2. login.dart: Layar login dengan fitur OTP.
    code:
   ```
   import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dashboard.dart'; // Import Dashboard
import 'register.dart'; // Import Register
import 'forgot_password.dart'; // Import ForgotPassword

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  bool isOtpSent = false;
  bool isLoading = false;
  String? generatedOtp;

  // Fungsi untuk mengosongkan semua input
  void clearInputs() {
    _emailController.clear();
    _passwordController.clear();
    _otpController.clear();
    setState(() {
      isOtpSent = false;
    });
  }

  // Fungsi untuk mengirim OTP ke WhatsApp melalui Fonnte
  Future<void> _sendOtp(String phoneNumber, String otp) async {
    final response = await http.post(
      Uri.parse('https://api.fonnte.com/send'),
      headers: {
        'Authorization': 'kxUK5VDQzNgHsz7q4MLc', // API key Fonnte 
      },
      body: {
        'target': phoneNumber,
        'message': 'Your OTP code is: $otp',
        'type': 'text',
      },
    );

    if (response.statusCode == 200) {
      print('OTP sent successfully');
    } else {
      print('Failed to send OTP: ${response.body}');
    }
  }

  // Fungsi untuk menghasilkan OTP acak
  String _generateOtp() {
    final random = Random();
    return (1000 + random.nextInt(9000)).toString(); // Membuat OTP 4 digit
  }

  // Fungsi login untuk autentikasi email dan password
  Future<void> login() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (response.user != null) {
        // Mengambil nomor telepon dari database
        String? phoneNumber = await _getPhoneNumber(response.user!.id);

        if (phoneNumber != null) {
          generatedOtp = _generateOtp();
          await _sendOtp(phoneNumber, generatedOtp!);

          setState(() {
            isOtpSent = true;
          });
          print('Login successful, OTP sent');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Phone number not found.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    } catch (e) {
      print('Login failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Fungsi untuk mendapatkan nomor telepon dari database berdasarkan user_id
  Future<String?> _getPhoneNumber(String userId) async {
    final response = await Supabase.instance.client
        .from('users')
        .select('phone')
        .eq('user_id', userId)
        .maybeSingle();

    if (response != null && response['phone'] != null) {
      return response['phone'] as String?;
    } else {
      return null;
    }
  }

  // Fungsi untuk verifikasi OTP
  Future<void> verifyOtp() async {
    if (_otpController.text == generatedOtp) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(clearInputs: clearInputs),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/login_image.png',
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to My App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text('Forgot Password?'),
                ),
              ),
              SizedBox(height: 16),
              if (isOtpSent)
                TextField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: isLoading ? null : (isOtpSent ? verifyOtp : login),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(isOtpSent ? 'Verify OTP' : 'Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Or'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
# 3. register.dart: Layar registrasi pengguna.
      code: 
 ```
      import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> register() async {
    setState(() {
      isLoading = true;
    });
    try {
      // Mendaftar pengguna baru di Supabase
      final AuthResponse response = await Supabase.instance.client.auth.signUp(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Jika registrasi berhasil, Menyimpan data tambahan di tabel users
      if (response.user != null) {
        // Memasukkan data tambahan (name dan phone) ke tabel users
        await Supabase.instance.client.from('users').insert({
          'user_id': response.user!.id,  // Menyimpan ID pengguna
          'name': _nameController.text,
          'phone': _phoneController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful!')),
        );
        Navigator.pop(context); // Kembali ke halaman login setelah registrasi berhasil
      }
    } catch (e) {
      print('Registration failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : register,
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Register'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
# 4. forgot_password.dart: Layar untuk reset password.
    code:
```
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool isLoading = false;

  // Untuk mengirim tautan reset password
  Future<void> _sendResetPasswordLink() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Mengirim link reset password tanpa memeriksa respons
      await Supabase.instance.client.auth.resetPasswordForEmail(_emailController.text);

      // Menampilkan pesan sukses
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Link reset password telah dikirim ke email Anda')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Terjadi kesalahan: $e')),
        );
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Masukkan email Anda untuk menerima link reset password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : _sendResetPasswordLink,
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Kirim Link Reset Password'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
# 5. dashboard.dart: Halaman utama setelah login.
    code:
```
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase
import 'payment_service.dart';

class DashboardScreen extends StatefulWidget {
  final VoidCallback clearInputs; // Menambahkan parameter clearInputs

  DashboardScreen({required this.clearInputs});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PaymentService paymentService = PaymentService();
  final SupabaseClient supabase = Supabase.instance.client; // Instance Supabase
  List<FoodItem> selectedItems = [];
  String? userEmail; // Variabel untuk menyimpan email pengguna
  String? userName; // Variabel untuk menyimpan nama pengguna

  @override
  void initState() {
    super.initState();
    _fetchUserDetails(); // Memanggil fungsi untuk mengambil email dan nama pengguna
  }

  // Fungsi untuk mengambil email dan nama pengguna yang sedang login dari Supabase
  void _fetchUserDetails() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      final response = await supabase
          .from('users')
          .select('name')
          .eq('user_id', user.id)
          .maybeSingle();

      setState(() {
        userEmail = user.email; // Mengambil email dari objek user
        userName = response?['name'] as String? ?? "User"; // Mengambil nama dari hasil query Supabase
      });
    }
  }

  // Fungsi untuk menentukan sapaan berdasarkan waktu saat ini
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

  void toggleSelection(FoodItem item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  int getTotalAmount() {
    return selectedItems.fold(0, (total, item) => total + item.amount);
  }

  void logout() {
    widget.clearInputs(); // Memanggil fungsi untuk mengosongkan input saat logout
    Navigator.pop(context); // Kembali ke halaman login
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
            onPressed: logout, // Memanggil fungsi logout saat tombol logout diklik
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
                      onPressed: () async {
                        int totalAmount = getTotalAmount();
                        String email = userEmail ?? "default@example.com"; // Menggunakan email pengguna atau default
                        String firstName = userName?.split(" ").first ?? "User";
                        String lastName = userName?.split(" ").last ?? "Example";
                        String phone = "08123456789"; // Ganti dengan nomor telepon pengguna jika tersedia

                        try {
                          await paymentService.createTransaction(totalAmount, email, firstName, lastName, phone);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Pembayaran berhasil diproses')),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Pembayaran gagal: $e')),
                          );
                        }
                      },
                      child: Text('Lanjutkan ke Pembayaran'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: EdgeInsets.symmetric(vertical: 12),
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

// Definisi kelas FoodItem
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
      other is FoodItem &&
          runtimeType == other.runtimeType &&
          foodName == other.foodName;

  @override
  int get hashCode => foodName.hashCode;
}

// Definisi widget FoodItemWidget
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
```
# 6. payment_service.dart: Layanan untuk integrasi pembayaran dengan Midtrans.
  	code
```
import 'dart:convert';
import 'package:http/http.dart' as http;

class PaymentService {
  final String serverKey = 'SB-Mid-server-TQgYv4K0-Q4CEx4jsgaKJEkI'; // server key

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
```

## Hasil Tampilan

# Halaman Login
1. Form untuk email dan password.

   
  ![f9431bbb-0ec5-49a0-84a2-ef44aa6408d7](https://github.com/user-attachments/assets/12f11f7d-31d2-4e95-9cde-71e1e5ec5fac)
3. Verifikasi OTP.

  ![02047143-caac-4997-8997-1fbd29e3c0b6](https://github.com/user-attachments/assets/988d4354-45dd-4ea4-8eab-576407f13e86)



#. Halaman Registrasi
1. Input untuk nama lengkap, email, nomor telepon, dan password.

  ![29e4d217-6d95-4cac-87da-e5ebc3ac199d](https://github.com/user-attachments/assets/ed6ae1a4-fd08-448e-b9a5-aac3d4dcd485)
  
   
# Halaman Dashboard

1. Sapaan berdasarkan waktu.
2. Tampilan daftar makanan yang bisa dipilih.
3. Total biaya dan tombol pembayaran.
   
![5db51234-6317-4d5c-ae55-8cd3a5b59504](https://github.com/user-attachments/assets/38c6515c-96e8-4418-8e27-a56826113d75)

## Teknologi yang Digunakan

# Flutter: Framework untuk membangun aplikasi mobile.
# Supabase: Backend sebagai layanan (BaaS).
# Midtrans: Gateway pembayaran.
# Fonnte: Pengiriman OTP melalui WhatsApp.
