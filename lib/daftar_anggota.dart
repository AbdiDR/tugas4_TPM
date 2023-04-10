import 'package:flutter/material.dart';

import 'login_page.dart';
import 'home_page.dart';

class MenuDaftarAnggota extends StatelessWidget {
  final String username;

  MenuDaftarAnggota({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar angggota'),
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(140),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("../assets/rangga.jpg"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rangga Restu Ramadhani",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("NIM : 123200124", style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height:20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(140),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("../assets/fotooo.jpg"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Abdi Dwi Ramdani",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("NIM : 123200143", style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height:20,
                  ),
                ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black87, // set the color of the selected icon
        unselectedItemColor: Colors.black87,// set the color of the unselected icons
        backgroundColor: Colors.red,
        onTap: (value) {
          if (value == 0) Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(username: username))) ;
          if (value == 1) Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuDaftarAnggota(username: username))) ;
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

