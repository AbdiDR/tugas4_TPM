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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 16),
          Text('Selamat datang di aplikasi Stopwatch dan Penyedia Link situs'),
          SizedBox(height: 20),
          Text(
            'The next page is the main menu page where there will be 4 choices of feature pages and at the bottom there will be 3 other page choices ',
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text(
            'The first feature is a page to see a list of our group members',
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text(
            'You can see our recommendation sites in some game by clicked in recommendation sites,'
                ' In this recommendation sites you can visit the game link and also add it to you favorite.',
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text(
            'The second feature is a simple stopwatch where the way to use it is:'
                '1. press the start button'
                '2. if you want to stop just press the stop button'
                '3. if you want to reset just press the restart button',
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text(
            'The third feature is the recommendation site page where there will be several sites that we recommend and users can open the site which will be directed to the site page. Users can also make sites that users like into favorites by simply pressing the heart button on the site according to the site.',
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text(
            'Then continued the last feature, namely the list of sites that have become favorite sites'
                'For other page options, there is a menu page which is the initial page'
                'Then there is a tutorial page that the user is now reading'
                'The last is the logout page for users to exit back to the login page',
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text(
            'Thank you for using our application -Author',
            textAlign: TextAlign.center,
          ),
        ],
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