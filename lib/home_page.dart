import 'package:flot/daftar_anggota.dart';
import 'package:flot/situs_rekomendasi.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {

  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Selamat datang ' + widget.username, style: const TextStyle(fontSize: 24))),
            const SizedBox(height: 20),
            const Text('Pilih menu:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 40),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MenuDaftarAnggota(username: widget.username)));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 40.0),
                    primary: Colors.red,
                  ),
                  icon: const Icon(Icons.account_box),  //icon data for elevated button
                  label: const Text("Daftar anggota"), //label text
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 40.0),
                    primary: Colors.red,
                  ),
                  icon: const Icon(Icons.timer),  //icon data for elevated button
                  label: const Text("Aplikasi Stopwach"), //label text
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => DaftarSitus(username: widget.username)));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 40.0),
                    primary: Colors.red,
                  ),
                  icon: const Icon(Icons.book),  //icon data for elevated button
                  label: const Text("Daftar situs"), //label text
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 40.0),
                    primary: Colors.red,
                  ),
                  icon: const Icon(Icons.favorite),  //icon data for elevated button
                  label: const Text("Favorite"), //label text
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white, // set the color of the selected icon
        unselectedItemColor: Colors.white,// set the color of the unselected icons
        backgroundColor: Colors.red,
        onTap: (value) {
          if (value == 0) Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(username: widget.username))) ;
          if (value == 1) Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuDaftarAnggota(username: widget.username))) ;
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
