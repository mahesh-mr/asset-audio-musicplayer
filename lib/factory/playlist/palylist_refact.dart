// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlayListRefact extends StatelessWidget {
  final Ptitle;

  const PlayListRefact({
    Key? key,
    required this.Ptitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          // ignore: prefer_const_literals_to_create_immutables
                          colors: [Colors.white60, Colors.white10]),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Colors.white30,
                      )),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            image: DecorationImage(
                                image: AssetImage("assets/image/logo.png"),
                                fit: BoxFit.fill),
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
                            Ptitle,
                         
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      colors: [
                                    Color.fromARGB(255, 8, 216, 199),
                                    Color.fromARGB(255, 151, 216, 230),
                                    Color.fromARGB(255, 5, 129, 112),
                                  ])),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      CupertinoIcons.tag_solid,
                                      color: Colors.black,
                                    ),
                                    title: Text("Edit name"),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      CupertinoIcons.delete_solid,
                                      color: Colors.black,
                                    ),
                                    title: Text("Remove"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
