import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helper/apiservice.dart';
import 'core/helper/cachhelper.dart';
import 'core/theming/apptheme/cubit/apptheme_cubit.dart';
import 'features/fav/data/repo/favrepo.dart';
import 'features/fav/presination/bloc/adddeletefav/bloc/adddeletfav_bloc.dart';
import 'features/fav/presination/bloc/get/fav_bloc.dart';
import 'features/home/data/repo/genrerepo.dart';
import 'features/home/data/repo/homerepo.dart';
import 'features/home/data/repo/movierepo.dart';
import 'features/home/presinatiion/bloc/categrois/getting_catg_bloc.dart';
import 'features/home/presinatiion/bloc/categrois/moviegeners_bloc.dart';
import 'features/home/presinatiion/bloc/movie/cast/bloc/cast_bloc.dart';
import 'features/home/presinatiion/bloc/movie/detailsmoviebloc/moviebloc_bloc.dart';
import 'features/home/presinatiion/bloc/movie/similarmovie/bloc/similiar_bloc.dart';
import 'features/home/presinatiion/bloc/movie/videobloc/bloc/video_bloc.dart';
import 'features/home/presinatiion/bloc/popular/bloc/populars_bloc.dart';
import 'features/home/presinatiion/bloc/topratedbloc/bloc/toprated_bloc.dart';
import 'features/home/presinatiion/bloc/upcoming/homeblock_bloc.dart';
import 'features/rating/data/repo/raterepo.dart';
import 'features/rating/presination/bloc/addrating_bloc.dart';
import 'features/rating/presination/bloc/deleterate_bloc.dart';
import 'features/rating/presination/bloc/getrating_bloc.dart';
import 'features/rating/presination/bloc/reviewbloc/bloc/review_bloc.dart';
import 'features/search/data/repo/searchrepo.dart';
import 'features/search/presination/bloc/searchbloc_bloc.dart';
import 'features/splach/splash_screan.dart';
import 'features/tv/data/repo/tvrepo.dart';
import 'features/tv/presination/bloc/casttv_bloc.dart';
import 'features/tv/presination/bloc/detailstv_bloc.dart';
import 'features/tv/presination/bloc/nowontv_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();

  runApp(const Moovize());
}

class Moovize extends StatelessWidget {
  const Moovize({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              HomeblockBloc(Homerepo(Apiservice(Dio()))),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              GettingCatgBloc(Generrepo(Apiservice(Dio()))),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              TopratedBloc(Homerepo(Apiservice(Dio()))),
        ),
        BlocProvider(
          create: (BuildContext context) => AdddeletfavBloc(
              favRepoImpl: FavRepoImpl(cachehelper: CacheHelper())),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              MovieblocBloc(Movierepo(Apiservice(Dio()))),
        ),
        BlocProvider(create: (BuildContext context) => AppthemeCubit()..getthemeTheme()),

        BlocProvider(
            create: (BuildContext context) =>
                CastBloc(Movierepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                SimiliarBloc(Movierepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                VideoBloc(Movierepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                PopularsBloc(Homerepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                SearchblocBloc(Searchrepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                NowontvBloc(Tvrepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                DetailstvBloc(Tvrepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                CasttvBloc(Tvrepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                MoviegenersBloc(Generrepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                ReviewBloc(Movierepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                AddratingBloc(Raterepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                DeleterateBloc(Raterepo(Apiservice(Dio())))),
        BlocProvider(
            create: (BuildContext context) =>
                GetratingBloc(Raterepo(Apiservice(Dio())))),
        BlocProvider(
            create: (context) =>
                FavBloc(favRepoImpl: FavRepoImpl(cachehelper: CacheHelper()))),
      ],
      child: BlocBuilder<AppthemeCubit, ChangeTheme>(
        builder: (context, state) {
          return MaterialApp(
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: TextScaler.linear(1.0)),
                  child: child!);
            },
            // themeMode: ThemeMode.dark,
            theme: state.theme,
            home: const Splachscreanview(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
