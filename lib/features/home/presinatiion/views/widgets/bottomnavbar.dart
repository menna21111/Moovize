import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../fav/presination/view/screan/favscrean.dart';
import '../../../../search/presination/views/screean/searchscrean.dart';
import '../../../../tv/presination/views/screan/tvscrean.dart';
import '../screan/homescrean.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int currentindex = 0;
  void changepage(int index) {
    setState(() {
      currentindex = index;
    });
  }

  List<Widget> pages = [const Homescrean() 
      
    ,const Searchscrean() ,
     const Tvscrean() ,const Favscrean() ,
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
              selectedIndex: currentindex,
              gap: 8,
              backgroundColor: Colors.black,
              tabBackgroundColor: Colors.grey.shade800,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              activeColor: Colors.white,
              onTabChange:changepage,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.favorite,
                  text: "fav",
                ),
                GButton(
                  icon: Icons.tv,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.search,
                  text: "Home",
                ),
              ]),
        ),
      ),
    );
  }
}
