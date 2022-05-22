// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SongListed extends StatelessWidget {
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final Simage;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final Stitle;
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  final Ssubtile;
  // ignore: prefer_typing_uninitialized_variables
  final artist;
  // ignore: prefer_const_constructors_in_immutables, non_constant_identifier_names
  SongListed({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.Simage,
    // ignore: non_constant_identifier_names
    required this.Stitle,
    // ignore: non_constant_identifier_names
    required this.Ssubtile,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Card(
            color: Colors.transparent,
            child: Container(
              color: Colors.transparent,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage(Simage), fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Stitle,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          Ssubtile,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          artist,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            CupertinoIcons.heart_solid,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
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
                                            title: Text("Add to Plylist"),
                                          ),
                                          const ListTile(
                                            leading: Icon(
                                              CupertinoIcons.tag_solid,
                                              color: Colors.black,
                                            ),
                                            title: Text("Edit name"),
                                          ),
                                          const ListTile(
                                            leading: Icon(
                                              CupertinoIcons.delete_solid,
                                              color: Colors.black,
                                            ),
                                            title: Text("Remove"),
                                          ),
                                        ],
                                      ),
                                    ));
                          },
                          child: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
