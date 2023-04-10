import 'package:flutter/material.dart';
import 'situs_data.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'tutorial_page.dart';
class Favorites extends StatelessWidget {
  final String username;
  const Favorites({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite'),
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
        body: ListView.builder(
            itemCount: situsFavList.length,
            itemBuilder: (context, index) {
              final SitusData list = situsFavList[index];
              return ListTile(
                leading: Image.network(
                  list.image,
                  width: 150,
                ),
                title: Text(list.name),
                subtitle: Text(list.type),
              );
            }
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