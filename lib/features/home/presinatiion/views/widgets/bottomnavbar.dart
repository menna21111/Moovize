import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../../core/theming/app_theme.dart';
import '../../../../../core/theming/apptheme/cubit/apptheme_cubit.dart';
import '../../../../fav/presination/view/screan/favscrean.dart';
import '../../../../search/presination/views/screean/searchscrean.dart';
import '../../../../tv/presination/views/screan/tvscrean.dart';
import '../screan/homescrean.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key, required this.isdark});
  final bool isdark;
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

  List<Widget> pages = [
    const Homescrean(),
    const Searchscrean(),
    const Tvscrean(),
    const Favscrean(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isdarke=widget.isdark;
    BlocBuilder<AppthemeCubit, ChangeTheme>(
      builder: (context, state) {
        bool isdark = state.theme == appthemedata[AppTheme.dark]!;
        isdarke = isdark;
        return Container();
      },
    );
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: Container(
        color: isdarke ? Colors.black : Colors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
              selectedIndex: currentindex,
              gap: 8,
              backgroundColor: widget.isdark ? Colors.black : Colors.grey,
              tabBackgroundColor: Colors.grey.shade800,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              activeColor: Colors.white,
              onTabChange: changepage,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.search,
                  text: "search",
                ),
                GButton(
                  icon: Icons.tv,
                  text: "tv",
                ),
                GButton(
                  icon: Icons.favorite,
                  text: "fav",
                ),
              ]),
        ),
      ),
    );
  }
}
