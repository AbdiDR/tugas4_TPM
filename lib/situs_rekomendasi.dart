import 'package:flutter/material.dart';
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
                                  icon: Icon(
                                    Icons.favorite,
                                    color: alreadyAdded ? Colors.red : Colors.grey,
                                  ),
                                  onPressed: ()
                                  {
                                    String text = '';
                                    setState(() {
                                      if(alreadyAdded) {
                                        situsFavList.remove(list);
                                        text  = "Berhasil dihapus";
                                      }
                                      else {
                                        situsFavList.add(list);
                                        text = "Berhasil ditambahkan";
                                      }
                                      SnackBar snackBar = SnackBar(
                                        content: Text(text),
                                        duration: const Duration(seconds: 1),
                                        backgroundColor: (alreadyAdded) ? Colors.black : Colors.green,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
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
        )
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}