// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FavouriteRefact extends StatelessWidget {
  final Fimage;
  final Ftitle;
  final Fsubtile;

  const FavouriteRefact({
    Key? key,
    required this.Fimage,
    required this.Ftitle,
    required this.Fsubtile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Padding(
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: AssetImage(Fimage), fit: BoxFit.fill),
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
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(Fsubtile,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w300)),
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
                      color: Color.fromARGB(255, 133, 50, 77),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
