import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/size.dart';
import '../../../../../core/theming/app_theme.dart';
import '../../../../../core/theming/apptheme/cubit/apptheme_cubit.dart';
import '../../bloc/categrois/getting_catg_bloc.dart';
import '../../bloc/popular/bloc/populars_bloc.dart';
import '../../bloc/topratedbloc/bloc/toprated_bloc.dart';
import '../../bloc/upcoming/homeblock_bloc.dart';
import '../widgets/TOPRATEDNET.dart';
import '../widgets/banner.dart';
import '../widgets/categoryhome.dart';

class Homescrean extends StatelessWidget {
  const Homescrean({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GettingCatgBloc>().add(GetGenresmovie());
    context.read<TopratedBloc>().add(Gettoprated());
    context.read<HomeblockBloc>().add(Getupcoming());
    context.read<PopularsBloc>().add(Getpopular());

    Screan_size.init(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo (2).png',
                  height: 50,
                  width: 180,
                  fit: BoxFit.fill,
                ),
                BlocBuilder<AppthemeCubit, ChangeTheme>(
                  builder: (context, state) {
                    bool mode=state.theme==appthemedata[AppTheme.dark]!;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: const Icon(
                           Icons.dark_mode,
                        color: Colors.amber,
                        size: 30, 
                        ),onPressed: (){
                          context.read<AppthemeCubit>().changeTheme(!mode);
                        },
                      
                      ),
                    );
                  },
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: Screan_size.width * 0.6,
                      child: const Text(
                        'DISCOVER YOUR NEXT FAVORITE MOVIE.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 209, 194, 194),
                        ),
                        textAlign: TextAlign.start,
                      )),
                  // IconButton(onPressed: (){}, icon: const Icon(Icons.notifications,size: 32,color: Colors.white,))
                ],
              ),
            ),
            const Banners(),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('categories 🍿',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )),
            SizedBox(
                height: Screan_size.hieght * 0.09, child: const Categoryiesh()),
            SizedBox(
              height: Screan_size.hieght * 0.01,
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('top on Netflix 🔥',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
            ),
            SizedBox(
              height: Screan_size.hieght * 0.01,
            ),
            SizedBox(height: Screan_size.hieght * 0.32, child: const Upcomov()),
          ],
        ),
      )),
    );
  }
}
