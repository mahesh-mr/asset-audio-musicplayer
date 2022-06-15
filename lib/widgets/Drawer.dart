import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player1/dialogs/policy.dart';
import 'package:share_plus/share_plus.dart';

class NavigationDrawerWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        child: Drawer(
          child: Container(
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(children: [
                ListTile(
                  leading: Image.asset("assets/image/logo.png"),
                  title: const Text(
                    'Soulmix',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
                const Divider(
                  thickness: 3,
                ),
                ListTile(
                  leading: const Icon(Icons.share_sharp),
                  title: const Text("Share"),
                  onTap: () {
                    Share.share(
                        'https://github.com/mahesh-mr/asset-audio-musicplayer');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text("Notification"),
                  trailing: Switch(
                    value: isSwitched,
                    onChanged: toogleSwitch,
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text("About"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutData(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text("Privacy Policy/n "),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return Policy(mdFilename: 'Privacy_Policy.md');
                        });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.verified_user_outlined),
                  title: const Text("Terms & Conditions"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return Policy(mdFilename: 'Terms_and_condition.md');
                        });
                  },
                ),
                const Spacer(),
                const Text('verssion'),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('1.0.2'),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void toogleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;

        const SnackBar(
          content: const Text(" notification"),
          duration: const Duration(microseconds: 600),
          backgroundColor: Colors.green,
        );
      });
    } else {
      setState(() {
        isSwitched = false;

        const SnackBar(
          content: const Text(" notification"),
          duration: const Duration(microseconds: 600),
          backgroundColor: Colors.red,
        );
      });
    }
  }
}

class AboutData extends StatelessWidget {
  const AboutData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primaryColorDark: const Color.fromARGB(255, 221, 255, 252),
          cardColor: const Color.fromARGB(255, 221, 255, 252),
          backgroundColor: const Color.fromARGB(255, 221, 255, 252),
          accentColor: const Color.fromARGB(255, 221, 255, 252),
        ),
      ),
      child: LicensePage(
        //applicationName: 'ChoordSIC',
        applicationVersion: '1.0.2',
        applicationIcon:
            Image.asset('assets/image/logo.png', width: 200, height: 200
                //applicationIcon: ,
                ),
        applicationLegalese: "Developed By MAHESH M R",
      ),
    );
  }
}
