import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';

class TutorPage extends StatelessWidget {
  final String username;
  const TutorPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
        title: const Text('Tutorial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 16),
            Text(
              'Selamat datang di Aplikasi Stopwatch dan Penyedia Link Situs',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Aplikasi ini terdiri dari 4 menu utama di Homepage dan bottom navbar untuk berpindah halaman.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              'Menu pertama yaitu menu Daftar Anggota yang akan menampikan profil anggota kelompok.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              'Menu kedua yaitu menu Stopwatch, adapun penjelasan menu tersebut yaitu sebaga berikut:\n'
                  '1. tersedia 3 tombol pada menu Stopwatch, yaitu tombol Start, Stop, dan Reset\n'
                  '2. tombol start berfungsi untuk memulai hitungan Stopwatch dimulai dari detik ke 0\n'
                  '3. tombol stop berfungsi untuk menghentikan hitungan Stopwatch, dan dapat dilanjutkan lagi jika menekan tombol start'
                  '4. tombol reset berfungsi untuk mengulangi hitungan Stopwatch',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              'Menu ketiga yaitu menu Daftar Situs yang kami rekomendasikan berisi bahan-bahan untuk belajar. Saat pengguna menekan card situs pada menu, pengguna akan langsung diarahkan menuju website resmi situs yang dapat dibuka mengggunakan browser pengguna. Pengguna juga dapat menekan tombol dengan simbol hati pada setiap cardview. Hal tersebut berarti bahwa pengguna akan menyimpan situs tersebut ke daftar situs favorut yang dapat diakses pada menu 4.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              'Thank you for using our application -Author',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white, // set the color of the selected icon
        unselectedItemColor: Colors.white,// set the color of the unselected icons
        backgroundColor: Colors.red,
        onTap: (value) {
          if (value == 0) Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(username: username))) ;
          if (value == 1) Navigator.push(context, MaterialPageRoute(builder: (context)=> TutorPage(username: username))) ;
        },

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME PAGE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'TUTORIAL',
          ),
        ],
      ),
    );
  }
}