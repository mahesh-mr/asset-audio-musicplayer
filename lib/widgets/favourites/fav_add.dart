import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player1/model/model.dart';
import 'package:music_player1/widgets/favourites/favurateIcon.dart';
import 'package:music_player1/widgets/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FavouriteAdd extends StatefulWidget {
  const FavouriteAdd({Key? key}) : super(key: key);

  @override
  State<FavouriteAdd> createState() => _FavouriteAddState();
}

class _FavouriteAddState extends State<FavouriteAdd> {
  final box = Songbox.getInstance();

  List<Songs> dbSongs = [];
  List<Songs> playlistSong = [];
  @override
  void initState() {
    super.initState();
    allFullSongs();
  }

  allFullSongs() {
    dbSongs = box.get("musics") as List<Songs>;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var likedsongs = box.get("favourites");

    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            child: Container(
                alignment: Alignment.center,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.white60, Colors.white10]),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: Colors.white30,
                              )),
                          child: ListTile(
                            leading: QueryArtworkWidget(
                              id: dbSongs[index].id!,
                              type: ArtworkType.AUDIO,
                              artworkBorder: BorderRadius.circular(50),
                              artworkFit: BoxFit.cover,
                              nullArtworkWidget: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
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
                            trailing: FavouriteIcon(
                                songId: fullSongs[index].metas.id.toString()),
                          ),
                        )))));
      },
      itemCount: dbSongs.length,
    );
  }
}
