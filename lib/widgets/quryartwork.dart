import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class QuryArtwork extends StatelessWidget {
   QuryArtwork({ Key? key, required this.id, }) : super(key: key);
   int id;
   
 

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
                                    artworkFit: BoxFit.cover,
                                    id: id,
                                    // artworkBorder: BorderRadius.circular(5),
                                    type:  ArtworkType.AUDIO,

                                    artworkQuality: FilterQuality.high,
                                    size: 2000,
                                    quality: 100,
                                    artworkBorder:
                                        BorderRadius.circular(50),

                                    //============No_Thumbnail=============//
                                    nullArtworkWidget: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(40)),
                                      child: Image.asset(
                                        'assets/image/logo.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
  }
}