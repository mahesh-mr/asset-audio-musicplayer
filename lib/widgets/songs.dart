import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:music_player1/widgets/players/openplayer.dart';
import 'package:music_player1/model/model.dart';
import 'package:music_player1/widgets/favourites/favurateIcon.dart';
import 'package:music_player1/widgets/players/miniplayer.dart';
import 'package:music_player1/widgets/Drawer.dart';
import 'package:music_player1/widgets/playlist/crateplaylist/createplaylist.dart';
import 'package:music_player1/widgets/search.dart';
import 'package:music_player1/widgets/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'search.dart';

class SongsList extends StatefulWidget {
  const SongsList({
    Key? key,
  }) : super(key: key);

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  final OnAudioQuery audioQuery = OnAudioQuery();
  final box = Songbox.getInstance();

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        bottomSheet: const Miniplayer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Songs ',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MySearch());
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
                sortType: SongSortType.ALBUM,
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL,
                ignoreCase: true),
            builder: (context, item) {
              if (item.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (item.data!.isEmpty) {
                return const Center(
                  child: Text('No Songs Found'),
                );
              }
              return RefreshIndicator(
                onRefresh: requestStoragePermission,
                child: ListView.builder(
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
                                  visualDensity:
                                      const VisualDensity(vertical: -2),
                                  onTap: (() async {
                                    final songid =
                                        fullSongs[index].metas.id.toString();
                                    await OpenPlayer(
                                            fullSongs: [],
                                            index: index,
                                            songId: songid)
                                        .openAssetPlayer(
                                            index: index, songs: fullSongs);
                                  }),
                                  //==============
                                  leading: QueryArtworkWidget(
                                    artworkFit: BoxFit.cover,
                                    id: int.parse(
                                        fullSongs[index].metas.id.toString()),
                                    // artworkBorder: BorderRadius.circular(5),
                                    type: ArtworkType.AUDIO,

                                    artworkQuality: FilterQuality.high,
                                    size: 2000,
                                    quality: 100,
                                    artworkBorder: BorderRadius.circular(50),

                                    //============No_Thumbnail=============//
                                    nullArtworkWidget: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(40)),
                                      child: Image.asset(
                                        'assets/image/logo.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  title: SizedBox(
                                    height: 22,
                                    child: Marquee(
                                      blankSpace: 10,
                                      velocity: 10,
                                      text: fullSongs[index].metas.album!,
                                      //   maxLines: 1,
                                      //   overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  subtitle: Text(
                                    fullSongs[index].metas.artist!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  trailing: Column(
                                    children: [
                                      Wrap(
                                        children: [
                                          FavouriteIcon(
                                              songId: fullSongs[index]
                                                  .metas
                                                  .id
                                                  .toString()),
                                          const Spacer(),
                                          SongButton(song: dbSongs[index]),
                                        ],
                                      ),
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
                  itemCount: fullSongs.length,
                ),
              );
            }));
  }
}

Future<void> requestStoragePermission() async {
  bool permissionStatus = await audioQuery.permissionsStatus();
  if (!permissionStatus) {
    await audioQuery.permissionsRequest();
  }
}
