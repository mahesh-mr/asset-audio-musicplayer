import 'dart:ui';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player1/factory/openplayer.dart';
import 'package:music_player1/model/model.dart';
import 'package:music_player1/widgets/Home.dart';
import 'package:music_player1/widgets/miniplayer.dart';
import 'package:music_player1/widgets/Drawer.dart';
import 'package:music_player1/widgets/search.dart';
import 'package:music_player1/widgets/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'search.dart';

class SongsList extends StatefulWidget {

 
  SongsList({Key? key,}) : super(key: key);

 

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  final OnAudioQuery audioQuery = OnAudioQuery();
  final box = Songbox.getInstance();

 
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // final AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');
  // Audio find(List<Audio> source, String fromPath) {
  //   return source.firstWhere((element) => element.path == fromPath);
  // }

  @override
  Widget build(BuildContext context) {
   

   

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      bottomSheet: miniplayer(),
      // drawer: NavigationDrawerWidget(),
      backgroundColor: Colors.transparent,

      //====================Mini_Player====================//

      // bottomSheet: miniplayer(),
      //====================Appbar====================//

      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Home',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => search(fullSongs:fullSongs)));
              },
              icon: const Icon(
                Icons.search,
                // size: 35,
                color: Colors.white,
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

      //====================Song_List_Internal====================//

      body: FutureBuilder<List<SongModel>>(
          future: audioQuery.querySongs(
            sortType: null,
            orderType: OrderType.ASC_OR_SMALLER,
            uriType: UriType.EXTERNAL,
            ignoreCase: true,
          ),
          builder: (context, item) {
            if (item.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (item.data!.isEmpty) {
              return const Center(
                child: const Text(
                  'No songs found',
                ),
              );
            }

            return ValueListenableBuilder(
                valueListenable: box.listenable(),
            builder: (
              (context, value, child) => 
                 ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 5),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  visualDensity: const VisualDensity(vertical: -3),
                                  onTap: (() async {
                                    final songid = 
                                        fullSongs[index].metas.id
                                        .toString();
                                    await OpenPlayer(
                                            fullSongs: [],
                                            index: index,
                                            songId: songid)
                                        .openAssetPlayer(
                                            index: index,
                                            songs:fullSongs);
                                  }
                                  ),
                                  //==============
                                  leading: QueryArtworkWidget(
                                    artworkFit: BoxFit.cover,
                                    id: int.parse(
                                       fullSongs[index].metas.id
                                        .toString()),
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
                                   fullSongs[index].metas.title!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  subtitle: Text(
                                  fullSongs[index].metas.artist!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  //                                    )
                                  trailing: Wrap(
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: const Icon(
                                            CupertinoIcons.heart_fill,
                                            color: Colors.white54,
                                          )),
                                      const Spacer(),
                                      InkWell(
                                        child: const Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) => Container(
                                                    height: 200,
                                                    decoration:
                                                        const BoxDecoration(
                                                            gradient: LinearGradient(
                                                                begin: Alignment
                                                                    .topCenter,
                                                                end: Alignment
                                                                    .bottomCenter,
                                                                colors: [
                                                          Color.fromARGB(
                                                              255, 8, 216, 199),
                                                          Color.fromARGB(255,
                                                              151, 216, 230),
                                                          Color.fromARGB(
                                                              255, 5, 129, 112),
                                                        ])),
                                                    child: Column(
                                                      // ignore: prefer_const_literals_to_create_immutables
                                                      children: [
                                                        const ListTile(
                                                          leading: Icon(
                                                            CupertinoIcons
                                                                .text_badge_plus,
                                                            color: Colors.black,
                                                          ),
                                                          title: Text(
                                                              "Add to PlayList"),
                                                        ),
                                                        const ListTile(
                                                          // ignore: unnecessary_const
                                                          leading: const Icon(
                                                            CupertinoIcons
                                                                .tag_solid,
                                                            color: Colors.black,
                                                          ),
                                                          title:
                                                              Text("Edit name"),
                                                        ),
                                                        const ListTile(
                                                          // ignore: unnecessary_const
                                                          leading: const Icon(
                                                            CupertinoIcons
                                                                .delete_solid,
                                                            color: Colors.black,
                                                          ),
                                                          title: Text("Remove"),
                                                        ),
                                                      ],
                                                    ),
                                                  ));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemCount:fullSongs.length,
                 )
                ));
          }),
    );
  }

  Future<void> requestStoragePermission() async {
    bool permissionStatus = await audioQuery.permissionsStatus();
    if (!permissionStatus) {
      await audioQuery.permissionsRequest();
    }
    setState(() {});

    fetchedSongs = await audioQuery.querySongs();

    for (var element in fetchedSongs) {
      if (element.fileExtension == "mp3") {
        allSongs.add(element);
      }
    }
    mappedSongs = allSongs
        .map(
          (audio) => Songs(
              songname: audio.title,
              artist: audio.artist,
              songurl: audio.uri,
              duration: audio.duration,
              id: audio.id),
        )
        .toList();

    await box.put("musics", mappedSongs);
    dbSongs = box.get("musics") as List<Songs>;

    for (var element in dbSongs) {
      fullSongs.add(
        Audio.file(
          element.songurl.toString(),
          metas: Metas(
              title: element.songname,
              id: element.id.toString(),
              artist: element.artist),
        ),
      );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    }
    setState(() {});
  }

  Songs findwatchlaterSongs(List<Songs> recently, String id) {
    return recently
        .firstWhere((element) => element.songurl.toString().contains(id));
  }
}
