import 'package:flutter/material.dart';
import 'situs_data.dart';

class Favorites extends StatelessWidget {
  final String username;
  const Favorites({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite'),
          backgroundColor: Colors.red,
          centerTitle: true,
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
    );
  }
}