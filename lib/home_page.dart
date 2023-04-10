import 'package:flot/daftar_anggota.dart';
import 'package:flot/situs_rekomendasi.dart';
import 'package:flutter/material.dart';


import 'login_page.dart';

class HomePage extends StatefulWidget {

  final String username;

  HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
              );
            },
            icon: Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Selamat datang ' + widget.username, style: TextStyle(fontSize: 24))),
            SizedBox(height: 20),
            Text('Pilih menu:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MenuDaftarAnggota(username: widget.username)));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 40.0),
                    primary: Colors.red,
                  ),
                  icon: Icon(Icons.account_box),  //icon data for elevated button
                  label: Text("Daftar anggota"), //label text
                ),
                ElevatedButton.icon(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 40.0),
                    primary: Colors.red,
                  ),
                  icon: Icon(Icons.timer),  //icon data for elevated button
                  label: Text("Aplikasi Stopwach"), //label text
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => DaftarSitus(username: widget.username)));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 40.0),
                    primary: Colors.red,
                  ),
                  icon: Icon(Icons.book),  //icon data for elevated button
                  label: Text("Daftar situs"), //label text
                ),
                ElevatedButton.icon(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 40.0),
                    primary: Colors.red,
                  ),
                  icon: Icon(Icons.favorite),  //icon data for elevated button
                  label: Text("Favorite"), //label text
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
