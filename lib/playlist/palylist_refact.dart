// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlayListRefact extends StatelessWidget {
  final Pimage;
  final Ptitle;

  const PlayListRefact({
    Key? key,
    required this.Pimage,
    required this.Ptitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Card(
        color: Colors.transparent,
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: AssetImage(Pimage), fit: BoxFit.fill),
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
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
                                  Color.fromARGB(255, 248, 230, 236),
                                  Color.fromARGB(255, 141, 192, 221),
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
                          ));
                },
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
