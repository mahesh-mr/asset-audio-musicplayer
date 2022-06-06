

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
          height: 680,
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
                   ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text("Notification"),
                    trailing: const Icon(Icons.toggle_on,color: Colors.blue,),
                    onTap: () {},
                    
                  ),
                  const Spacer(),
                  const Text('verssion'),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('1.0.0'),
                  ),
                ]),
              ),
            ),
          ),
        ),
      );
    
  }
}
