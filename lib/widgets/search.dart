
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player1/factory/openplayer.dart';
import 'package:music_player1/model/model.dart';


import 'package:on_audio_query/on_audio_query.dart';

class search extends StatefulWidget {
   List<Audio> fullSongs = [];
 search({ Key? key, required this.fullSongs }) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final box = Songbox.getInstance();
  String search = "";
   List<Songs> dbSongs = [];
  List<Audio> allSongs = [];

  searchsongs(){
    dbSongs = box.get("musics")as List<Songs>;

    dbSongs.forEach((element) {
      allSongs.add(
        Audio.file(
          element.songurl.toString(),
          metas: Metas(
            title: element.songname,
            id: element.id.toString(),
            artist: element.artist,
          )
        )
      );
    },
    );
  }
@override
  void initState() {
    super.initState();
    searchsongs();
  }

  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Audio>searchTitle = allSongs.where((element) {
      return element.metas.artist!.toLowerCase().startsWith(
        search.toLowerCase(),
      );
    }).toList();
    List<Audio>searchArtist = allSongs.where((element) {
      return element.metas.artist!.toLowerCase().startsWith(
        search.toLowerCase(),
      );
    }).toList();

    List<Audio> searchResult =[];
    if(searchTitle.isNotEmpty){
      searchResult =searchTitle;
    }else {
      searchResult =searchArtist;
    }
    return Container(
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
    child:Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,

        elevation: 0,
        title: Text('Search'),

      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height:  MediaQuery.of(context).size.height * .07,
              width: MediaQuery.of(context).size.width * .9, 
              child:TextField(
                cursorHeight: 18,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14,right: 10,left: 10),
                  suffixIcon: Icon(Icons.search),
                  hintText: 'search songs',
                  filled: true,
                  fillColor:  Color.fromARGB(255, 151, 216, 230),
                ),
                onChanged: (value){
                  setState(() {
                    search = value.trim();
                  }
                  );
                },

              ) ,
            ),
            search.isEmpty?
            searchResult.isNotEmpty?
            Expanded(child:ListView.builder(
              itemCount: searchResult.length,
              itemBuilder:(context ,index){
                return FutureBuilder(
                                  future: Future.delayed(
                                    const Duration(microseconds: 0),
                                  ),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return GestureDetector(
                                        onTap: () {
                                          OpenPlayer(
                                                  fullSongs: searchResult,
                                                  index: index, songId: widget.fullSongs[index].metas.id.toString(), 
                                                  
                                                  )
                                              .openAssetPlayer(
                                                  index: index,
                                                  songs: searchResult);
                                        },
                                        child: ListTile(
                                          leading: SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: QueryArtworkWidget(
                                              id: int.parse(searchResult[index]
                                                  .metas
                                                  .id!),
                                              type: ArtworkType.AUDIO,
                                              artworkBorder:
                                                  BorderRadius.circular(15),
                                              artworkFit: BoxFit.cover,
                                              nullArtworkWidget: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/logodefault.jpg"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            searchResult[index].metas.title!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:  TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(
                                            searchResult[index].metas.artist!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:  TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    return Container();
                                  },
                                );
                              },
                            ),
                          )
                        :  Padding(
                            padding: EdgeInsets.all(30),
                            child: Text(
                              "No Result Found",
                              style: TextStyle(
                                
                                fontSize: 20,
                              ),
                            ),
                          )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      );
    
  }
}

              




// class MySearch extends SearchDelegate {
//    List<Audio> fullSongs = [];
//    MySearch({Key? key, required this.fullSongs}): super(key:key)
//    @override
//   ThemeData appBarTheme(BuildContext context) {
//     return ThemeData(
//       appBarTheme: const AppBarTheme(
//         backgroundColor: Color.fromARGB(255, 8, 216, 199),
//         elevation: 0,
//       ),
//       // ignore: prefer_const_constructors
//       inputDecorationTheme: InputDecorationTheme(
//         border: InputBorder.none,

//         // Use this change the placeholder's text style
//         hintStyle: const TextStyle(fontSize: 24.0),
//       ),
//     );
//   }
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         color: Colors.white,
//         onPressed: () {
//           if (query.isEmpty) {
//             close(context, null);
//           } else {
//             query = '';
//           }
//         },
//         icon: const Icon(
//           Icons.clear,
//         ),
//       )
//     ];
//   }

 

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return Column(
//       children: [
//         IconButton(
//           onPressed: () {
//             close(context, null);
//           },
//           // ignore: prefer_const_constructors
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Center(
//       child: Text(
//         query,
//         style: const TextStyle(color:Colors.white,),
//       ),
//     );
//   }

// // search element
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final searchSongItems = query.isEmpty
//         ? songDetails
//         :songDetails
//             .where(
//               (element) => element.metas.title!.toLowerCase().contains(
//                     query.toLowerCase().toString(),
//                   ),
//             )
//             .toList()+
//             songDetails
//             .where((element) => element.metas.artist!.toLowerCase().contains(
//              query.toLowerCase().toString(), 
//             ),
//             ).toList();

//     return Container(
//         decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//              Color.fromARGB(255, 8, 216, 199),
//             Color.fromARGB(255, 151, 216, 230),
//             Color.fromARGB(255, 5, 129, 112),
//           ],
//           tileMode: TileMode.clamp,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: searchSongItems.isEmpty
//             ? const Center(
//                 child: Text(
//                   "No Songs Found!",
//                   style: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
//                 ),
//               )
//             :ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
//                   child: Container(
//                   alignment: Alignment.center,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(0),
//                     child: BackdropFilter(

//                       filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//                       child: Container(
//                         height: 80,
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomCenter,
//                                 colors: [Colors.white60, Colors.white10]),
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                               width: 2,
//                               color: Colors.white30,
//                             )),

//                              child: Center(
//                       child: ListTile(
//                         onTap: (() async {
//                           await 
//                          OpenPlayer(
//                             fullSongs: [],
//                             songId: songDetails[index].metas.id.toString() ,
//                             index: index,
//                           ).openAssetPlayer(
//                             index: index,
//                             songs: searchSongItems,
//                           );
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: ((context) => Playings()),
//                             ),
//                           );
//                         }),
//                         leading: QueryArtworkWidget(
//                           nullArtworkWidget: ClipRRect(
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(50),
//                             ),
//                             child: Image.asset(
//                               'assets/image/logo.png',
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           id: int.parse(searchSongItems[index].metas.id!),
//                           type: ArtworkType.AUDIO,
//                         ),
//                         title:
                            
//                             SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Text(
//                             searchSongItems[index].metas.title!,
                           
//                           ),
//                         ),
//                         subtitle:
                         
//                             SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Text(
//                             searchSongItems[index].metas.artist!,
                           
//                           ),
//                         ),
//                         trailing: IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.more_vert,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                         ),
//                       ),
//                     ),



//                       )
//                       )
//                       )
//                       ),
                   
                  
//                 );
//               },
//               itemCount: searchSongItems.length,
//             ),
//       ),
//     );
//   }
// }
