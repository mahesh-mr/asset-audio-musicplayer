// ignore_for_file: unnecessary_const

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListedAlbum extends StatelessWidget {
  final Aimage;
  final Atext;

  ListedAlbum({Key? key, required this.Aimage, required this.Atext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            height: 150,
            // width: 180,

            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage(Aimage), fit: BoxFit.fill)),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Row(
            children: [
              Text(
                Atext,
                style: const TextStyle(
                  color: Color.fromARGB(255, 51, 71, 43),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            height: 200,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Color.fromARGB(255, 248, 230, 236),
                                  Color.fromARGB(255, 141, 192, 221),
                                ])),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const ListTile(
                                  leading: Icon(
                                    CupertinoIcons.text_badge_plus,
                                    color: Colors.black,
                                  ),
                                  title: Text("Add to Album"),
                                ),
                                const ListTile(
                                  leading: const Icon(
                                    CupertinoIcons.tag_solid,
                                    color: Colors.black,
                                  ),
                                  title: Text("Edit name"),
                                ),
                                const ListTile(
                                  leading: const Icon(
                                    CupertinoIcons.delete_solid,
                                    color: Colors.black,
                                  ),
                                  title: Text("Remove"),
                                ),
                              ],
                            ),
                          ));
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
