// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:music_player1/model/model.dart';
import 'package:music_player1/widgets/favourites/fav_add.dart';
import 'package:music_player1/widgets/favourites/favurateIcon.dart';
import 'package:music_player1/widgets/players/player.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:music_player1/widgets/players/openplayer.dart';

import 'package:on_audio_query/on_audio_query.dart';

class Favourited extends StatefulWidget {
  const Favourited({Key? key}) : super(key: key);

  @override
  State<Favourited> createState() => _FavouritedState();
}

List<Audio> favSong = [];

class _FavouritedState extends State<Favourited> {
  final box = Songbox.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Favourites',
            style: TextStyle(
                color: Color.fromARGB(255, 128, 16, 16),
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Color.fromARGB(255, 8, 216, 199),
                                  Color.fromARGB(255, 151, 216, 230),
                                  Color.fromARGB(255, 5, 129, 112),
                                ])),
                            child: FavouriteAdd(),
                          );
                        });
                  },
                  icon: const Icon(
                    CupertinoIcons.heart_circle,
                    color: Colors.white,
                  )),
            )
          ],
        ),
        body: SafeArea(
            child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, value, child) {
            var favouritesSongs = box.get("favourites");
            return Stack(
              children: [
                favouritesSongs!.isEmpty
                    ? const Center(
                        child: Text(
                          'no favourites songs',
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    : ListView.builder(
                        // separatorBuilder: (context, index) => SizedBox(
                        //   height: 10,
                        // ),

                        itemCount: favouritesSongs.length,

                        itemBuilder: ((context, index) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 5),
                              child: Container(
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 15, sigmaY: 15),
                                          child: Container(
                                            height: 70,
                                            decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.white60,
                                                      Colors.white10
                                                    ]),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  width: 2,
                                                  color: Colors.white30,
                                                )),
                                            child: ListTile(
                                              onTap: () {
                                                for (var item
                                                    in favouritesSongs) {
                                                  favSong.add(Audio.file(
                                                      item.songurl,
                                                      metas: Metas(
                                                          id: item.id
                                                              .toString(),
                                                          artist: item.artist,
                                                          title:
                                                              item.songname)));
                                                }
                                                OpenPlayer(
                                                        fullSongs: favSong,
                                                        index: index,
                                                        songId: favSong[index]
                                                            .metas
                                                            .id
                                                            .toString())
                                                    .openAssetPlayer(
                                                        index: index,
                                                        songs: favSong);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: ((context) =>
                                                            Playings())));
                                              },
                                              leading: QueryArtworkWidget(
                                                id: favouritesSongs[index].id!,
                                                type: ArtworkType.AUDIO,
                                                artworkBorder:
                                                    BorderRadius.circular(50),
                                                artworkFit: BoxFit.cover,
                                                nullArtworkWidget: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(40)),
                                                  child: Image.asset(
                                                    'assets/image/logo.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              title: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 3, left: 5, bottom: 3),
                                                child: Text(
                                                  favouritesSongs[index]
                                                      .songname,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              subtitle: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.0),
                                                child: Text(
                                                  favouritesSongs[index].artist,
                                                ),
                                              ),
                                              trailing: Wrap(
                                                children: [
                                                  FavouriteIcon(
                                                      songId:
                                                          favouritesSongs[index]
                                                              .id
                                                              .toString()),
                                                ],
                                              ),
                                            ),
                                          )))));
                        }),
                      ),
              ],
            );
          },
        )));
  }
}
