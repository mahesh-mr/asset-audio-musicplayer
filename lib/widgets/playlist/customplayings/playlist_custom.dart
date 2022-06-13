import 'dart:ui';

import 'package:flutter/material.dart';

class PlaylistCustom extends StatelessWidget {
  final String? newTitle;
  final String? newSubtitle;
  final IconButton? newTrailing;
  final Function()? newOntap;
  const PlaylistCustom(
      {Key? key,
      required this.newTitle,
      this.newSubtitle,
      this.newTrailing,
      this.newOntap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        image: DecorationImage(
                            image: AssetImage("assets/image/logo.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    title: Text(newTitle!),
                    subtitle: Text('${newSubtitle!}Songs'),
                    trailing: newTrailing,
                    onTap: newOntap,
                  )),
            ),
          ),
        ));
  }
}
