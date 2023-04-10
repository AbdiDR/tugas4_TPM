import 'package:flutter/material.dart';
import 'daftar_anggota.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'situs_data.dart';
import 'package:url_launcher/url_launcher.dart';


class DaftarSitus extends StatelessWidget {
  final String username;
  const DaftarSitus({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Situs Rekomendasi"),
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
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              final SitusData list = listSitus[index];
              return Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                          onTap: (){
                            _launchUrl(list.url);
                          },
                          child: Column(
                            children: [
                              Image(
                                height: 250,
                                width: 150,
                                image: NetworkImage(list.image),
                              ),
                              SizedBox(height:10.0),
                              Text(list.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5,),
                              Text(list.type),
                              SizedBox(height: 20,),
                              Text(list.descipton)
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: listSitus.length,
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
        ));
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}