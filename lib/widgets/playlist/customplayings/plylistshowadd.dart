// ignore_for_file: unnecessary_const

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player1/model/model.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Songsheet extends StatefulWidget {
  String playlistName;
  Songsheet({Key? key, required this.playlistName}) : super(key: key);

  @override
  State<Songsheet> createState() => _SongsheetState();
}

class _SongsheetState extends State<Songsheet> {
  final box = Songbox.getInstance();
  List<Songs> dbSongs = [];
  List<Songs> playlistSongs = [];

  @override
  void initState() {
    super.initState();
    fullSongs();
  }

  fullSongs() {
    dbSongs = box.get("musics") as List<Songs>;
    playlistSongs = box.get(widget.playlistName)!.cast<Songs>();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dbSongs.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: QueryArtworkWidget(
                artworkFit: BoxFit.cover,
                id: dbSongs[index].id!,

                // artworkBorder: BorderRadius.circular(5),
                type: ArtworkType.AUDIO,

                artworkQuality: FilterQuality.high,
                size: 2000,
                quality: 100,
                artworkBorder: BorderRadius.circular(50),

                //============No_Thumbnail=============//
                nullArtworkWidget: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(40)),
                  child: Image.asset(
                    'assets/image/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                dbSongs[index].songname!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                dbSongs[index].artist!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: playlistSongs
                      .where((element) =>
                          element.id.toString() == dbSongs[index].id.toString())
                      .isEmpty
                  ? IconButton(
                      onPressed: () async {
                        playlistSongs.add(dbSongs[index]);
                        await box.put(widget.playlistName, playlistSongs);
                        setState(() {});
                      },
                      icon: Icon(Icons.add))
                  : IconButton(
                      onPressed: () async {
                        playlistSongs.removeWhere((element) =>
                            element.id.toString() ==
                            dbSongs[index].id.toString());
                        await box.put(widget.playlistName, playlistSongs);
                        setState(() {});
                      },
                      icon: Icon(Icons.check_box)));
        });
  }
}
