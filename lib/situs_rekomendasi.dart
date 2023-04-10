import 'package:flot/tutorial_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'situs_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DaftarSitus extends StatefulWidget {
  final String username;
  const DaftarSitus({Key? key, required this.username}) : super(key: key);

  @override
  State<DaftarSitus> createState() => _DaftarSitusState();
}

class _DaftarSitusState extends State<DaftarSitus> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Situs Rekomendasi"),
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
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              final SitusData list = listSitus[index];
              final alreadyAdded = situsFavList.contains(list);
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
                              IconButton(
                                  icon: new Icon(
                                    Icons.favorite,
                                    color: alreadyAdded ? Colors.red : Colors.grey,
                                  ),
                                  onPressed: ()
                                  {
                                    setState(() {
                                      if(alreadyAdded) {
                                        situsFavList.remove(list);
                                      }
                                      else {
                                        situsFavList.add(list);
                                      }
                                    });
                                  }
                              ),
                              Image(
                                height: 250,
                                width: 150,
                                image: NetworkImage(list.image),
                              ),
                              const SizedBox(height:10.0),
                              Text(list.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5,),
                              Text(list.type),
                              const SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
                                child: Text(
                                    list.descipton,
                                    textAlign: TextAlign.justify
                                ),
                              )
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
            selectedItemColor: Colors.white, // set the color of the selected icon
            unselectedItemColor: Colors.white,// set the color of the unselected icons
            backgroundColor: Colors.red,
            onTap: (value) {
              if (value == 0) Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(username: widget.username))) ;
              if (value == 1) Navigator.push(context, MaterialPageRoute(builder: (context)=> TutorPage(username: widget.username))) ;
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