// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_player1/favourite/favrout_refact.dart';
import 'package:music_player1/favourite/list_fav.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          // leading: Icon(Icons.menu_outlined),
          title: Text('Favourites'),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: ListView.builder(
            itemBuilder: (context, index) => FavouriteRefact(
                Fimage: fimage[index],
                Ftitle: ftitile[index],
                Fsubtile: fsubtitle[index]),
            itemCount: fimage.length));
  }
}
