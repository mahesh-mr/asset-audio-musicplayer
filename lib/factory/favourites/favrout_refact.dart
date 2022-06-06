// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FavouriteRefact extends StatelessWidget {
  final Ftitle;
  final Fsubtile;

  const FavouriteRefact({
    Key? key,
    required this.Ftitle,
    required this.Fsubtile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: Container(
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
                            height: 70,
                            width: 70,
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
                              Ftitle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Fsubtile,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: const Icon(
                                CupertinoIcons.heart_solid,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )))),
    );
  }
}
