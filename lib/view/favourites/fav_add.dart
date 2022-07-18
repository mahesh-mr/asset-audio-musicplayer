import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player1/controller/songcontroller/songcontroler.dart';
import 'package:music_player1/core/colors/colors.dart';
import 'package:music_player1/model/songmodel.dart';
import 'package:music_player1/view/favourites/favurate_Icon.dart';
import 'package:music_player1/widgets/glassmorphisom.dart';
import 'package:music_player1/widgets/marquee.dart';
import 'package:music_player1/widgets/quryartwork.dart';
import 'package:music_player1/widgets/text.dart';

// ignore: must_be_immutable
class FavouriteAdd extends StatelessWidget {
FavouriteAdd({Key? key}) : super(key: key);
 SongsController songsController = Get.put(SongsController());
List<Songs> dbSongs = [];
 

  @override
  Widget build(BuildContext context) {


   final size = MediaQuery.of(context).size;

    return Column(
      children: [
        ListTile(
          leading:const Icon(
            CupertinoIcons.heart_fill,
            color: red1,
          ),
          title: STexts(text: "Add Favourites"),
        ),
        Expanded(
          child: GetBuilder<SongsController>(
            builder: (controller) {
              List<Songs>allsongs = controller.box.values.toList();
              return ListView.builder(
                itemCount: allsongs.length,
                itemBuilder: (context, index) {
                  return GlassMore(height:size.height*.08,
                    column: ListTile(
                      leading: QuryArtwork(
                        id: allsongs[index].id!,
                      ),
                      title: Marque(
                        text: allsongs[index].songname!,
                      ),
                      subtitle: Marque(
                        text: allsongs[index].artist!,
                      ),
                      trailing: FavouriteIcon(
                        allSongs: allsongs,
                        index: index,
                      ),
                    ),
                  );
                },
              );
            }
          ),
        ),
      ],
    );
  }
}
