import 'package:flutter/material.dart';
import 'package:music_player1/model/model.dart';
import 'package:music_player1/widgets/playlist/flottingaction/playlistcreate.dart';

// ignore: must_be_immutable
class PlaylistButton extends StatelessWidget {
  PlaylistButton({Key? key, required this.song}) : super(key: key);
  Songs song;

  List playlists = [];

  List<dynamic>? playlistSongs = [];

  @override
  Widget build(BuildContext context) {
    final box = Songbox.getInstance();
    playlists = box.keys.toList();

    return IconButton(
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
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.add),
                          title: const Text("Create New Playlist"),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => const CreratePlaylist());
                          },
                        ),
                        ...playlists
                            .map(
                              (audio) => audio != "musics" &&
                                      audio != "favourites" &&
                                      audio != "Recently_Played"
                                  ? ListTile(
                                      onTap: () async {
                                        playlistSongs = box.get(audio);
                                        List existingSongs = [];
                                        existingSongs = playlistSongs!
                                            .where((element) =>
                                                element.id.toString() ==
                                                song.id.toString())
                                            .toList();
                                        if (existingSongs.isEmpty) {
                                          final songs =
                                              box.get("musics") as List<Songs>;
                                          final temp = songs.firstWhere(
                                              (element) =>
                                                  element.id.toString() ==
                                                  song.id.toString());
                                          playlistSongs?.add(temp);

                                          await box.put(audio, playlistSongs!);

                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(song.songname! +
                                                      "Added to Playlist")));
                                        } else {
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(song.songname! +
                                                      'is Already in Playlist')));
                                        }
                                      },
                                      leading: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/logo.png"),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      title: Text(audio.toString()),
                                    )
                                  : Container(),
                            )
                            .toList()
                      ],
                    ));
              });
        },
        icon: const Icon(
          Icons.playlist_add,
          color: Colors.white,
        ));
  }
}

// ignore: must_be_immutable
class SongButton extends StatefulWidget {
  SongButton({Key? key, required this.song}) : super(key: key);
  Songs song;

  @override
  State<SongButton> createState() => _SongButtonState();
}

class _SongButtonState extends State<SongButton> {
  List playlists = [];

  List<dynamic>? playlistSongs = [];

  @override
  Widget build(BuildContext context) {
    final box = Songbox.getInstance();
    playlists = box.keys.toList();

    @override
    void initState() => super.initState();

    return IconButton(
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
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                          title: const Text(
                            "Create New Playlist",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => const CreratePlaylist());
                          },
                        ),
                        ...playlists
                            .map(
                              (audio) => audio != "musics" &&
                                      audio != "favourites" &&
                                      audio != "Recently_Played"
                                  ? ListTile(
                                      onTap: () async {
                                        playlistSongs = box.get(audio);
                                        List existingSongs = [];
                                        existingSongs = playlistSongs!
                                            .where((element) =>
                                                element.id.toString() ==
                                                widget.song.id.toString())
                                            .toList();
                                        if (existingSongs.isEmpty) {
                                          final songs =
                                              box.get("musics") as List<Songs>;
                                          final temp = songs.firstWhere(
                                              (element) =>
                                                  element.id.toString() ==
                                                  widget.song.id.toString());
                                          playlistSongs?.add(temp);

                                          await box.put(audio, playlistSongs!);

                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(widget
                                                          .song.songname! +
                                                      "Added to Playlist")));
                                        } else {
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(widget
                                                          .song.songname! +
                                                      'is Already in Playlist')));
                                        }
                                      },
                                      leading: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/logo.png"),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      title: Text(audio.toString()),
                                    )
                                  : Container(),
                            )
                            .toList()
                      ],
                    ));
              });
        },
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ));
  }
}
