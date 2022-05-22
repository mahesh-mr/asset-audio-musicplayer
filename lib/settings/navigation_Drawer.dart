

import 'package:flutter/material.dart';



class NavigationDrawerWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  



  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.topLeft,
      child: SizedBox(
        height: 700,
        child: Drawer(
          child: Stack(
            children: [
              Image.asset(
                "assets/15.jpg",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(children: [
                  const Text(
                    'Settings',
                    style:  TextStyle(fontSize: 30),
                  ),
                  const Divider(
                    thickness: 3,
                  ),
             
                  
                  ListTile(
                    leading: const Icon(Icons.feedback),
                    title: const Text("Feedback"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock_sharp),
                    title: const Text("Privacy & Policy"),
                    onTap: () {},
                    
                  ),
                    ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text("About"),
                    onTap: () {},
                    
                  ),
                    ListTile(
                    leading: const Icon(Icons.share_sharp),
                    title: const Text("Share"),
                    onTap: () {},
                    
                  ),
                  const Spacer(),
                  const Text('verssion'),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('1.0.0'),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
