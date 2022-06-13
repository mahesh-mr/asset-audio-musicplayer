// ignore_for_file: prefer_const_constructors

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_player1/widgets/folder/folder.dart';
import 'package:music_player1/widgets/favourites/favourite.dart';
import 'package:music_player1/widgets/playlist/playlist.dart';
import 'package:music_player1/widgets/songs.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  // List<Audio>allsongs;
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Audio find(List<Audio> source, String fromPath) {
  return source.firstWhere((element) => element.path == fromPath);
}

class _HomeScreenState extends State<HomeScreen> {
  // final OnAudioQuery audioQuery = OnAudioQuery();
  // final AssetsAudioPlayer player =AssetsAudioPlayer.withId('0');

  int _currentSelectedIndex = 0;

  // final _pages = [
  //   const SongsList(),
  //   // Playings(index: 0,),
  //   // const Album(),
  //   const Playlis(),
  //   const Favourite(),
  // ];F

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      SongsList(),
      Playlis(),
      Favourited(),
    ];

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 8, 216, 199),
              Color.fromARGB(255, 151, 216, 230),
              Color.fromARGB(255, 5, 129, 112),
            ],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: _pages[_currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              showSelectedLabels: true,
              selectedItemColor: Colors.white,
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
      ),
    );
  }
}
