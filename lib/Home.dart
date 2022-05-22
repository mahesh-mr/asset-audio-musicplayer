// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_player1/bottomnav.dart';

import 'package:music_player1/album/album.dart';
import 'package:music_player1/favourite/favourite.dart';
import 'package:music_player1/playlist/playlist.dart';
import 'package:music_player1/songs/songs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSelectedIndex = 0;

  final _pages = [
    const SongsList(),
    // Playings(index: 0,),
    const Album(),
    const Playlis(),
    const Favourite(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/15.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomSheet: const BottomSheetd(),
          body: _pages[_currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              showSelectedLabels: true,
              selectedItemColor: const Color.fromARGB(255, 145, 43, 77),
              unselectedItemColor: Colors.white,
              currentIndex: _currentSelectedIndex,
              // ignore: non_constant_identifier_names
              onTap: (NewIndex) {
                setState(() {
                  _currentSelectedIndex = NewIndex;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.music_house),
                    activeIcon: Icon(CupertinoIcons.music_house_fill),
                    label: 'Songs'),
                // BottomNavigationBarItem(
                // icon: Icon(CupertinoIcons.headphones), label: 'Playing'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.disc_full_outlined),
                    activeIcon: Icon(Icons.disc_full_rounded),
                    label: 'Albums'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.my_library_music_outlined),
                    activeIcon: Icon(Icons.my_library_music_sharp),
                    label: 'Playlist'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart),
                    activeIcon: Icon(CupertinoIcons.heart_solid),
                    label: 'Favourites'),
              ]),
        ),
      ],
    );
  }
}
