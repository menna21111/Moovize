import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovize/features/fav/presination/bloc/get/fav_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../../data/models/movie_responsemodel.dart';
import '../../bloc/movie/detailsmoviebloc/moviebloc_bloc.dart';
import '../../bloc/movie/videobloc/bloc/video_bloc.dart';
import '../widgets/AddFavitem.dart';
import '../widgets/cast.dart';

import '../widgets/filminfo.dart';
import '../widgets/overview.dart';
import '../widgets/posterphotoandinfo.dart';
import '../widgets/reviews.dart';
import '../widgets/similarmovie.dart';
import '../widgets/video.dart';

class Filmscrean extends StatelessWidget {
  const Filmscrean({super.key, required this.movie});
final Movie movie;
  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Scaffold(
      body:
          BlocBuilder<MovieblocBloc, MovieblocState>(builder: (context, state) {
        if (state is MovieDetailsSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Posterphotoandinfo(
                  movie: state.data,
                ),
                SizedBox(
                  height: Screan_size.hieght * .04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<VideoBloc>()
                            .add(MovIdisplayvidao(state.data.id ?? 278));
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Video();
                        }));
                      },
                      child: Container(
                        // height: Screan_size.hieght * .075,
                        padding: const EdgeInsets.all(5),
                        width: Screan_size.width * .71,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: khhomecolor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_circle,
                              size: 40,
                              color: kwhitecolor,
                            ),
                            Text(
                              '  play video',
                              style: TextStyle(
                                color: kwhitecolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(),
                BlocBuilder<FavBloc, FavState>(
  builder: (context, statee) {
    if (statee is Favscuess) {
      bool isfav = statee.movieDetails
          .any((element) => element.id == state.data.id);
      
      return AddFavitem(isfav: isfav, id: movie);
    }
    return SizedBox(); // Return SizedBox instead of an empty Container
  },
)
,
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Overview(
                      moviedetails: state.data,
                    )),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                          color: Colors.yellow     ,                  fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      SizedBox(height: Screan_size.hieght * .25 , child: Reviews()),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Cast',
                      style: TextStyle(
                       color: Colors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      SizedBox(height: Screan_size.hieght * .3, child: Cast()),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'similar movies',
                      style: TextStyle(
                         color: Colors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: Screan_size.hieght * .3, child: Similarmovie()),
                )
              ],
            ),
          );
        } else if (state is MovieDetailsFailure) {
          return Center(
            child: Text(
              state.failure.errMessage,
              style: const TextStyle(color: kwhitecolor),
            ),
          );
        } else {
          return ShimmerLoading(
            width: 1,
            borderraduis: 0,
            height: 1,
          );
        }
      }),
    );
  }
}
