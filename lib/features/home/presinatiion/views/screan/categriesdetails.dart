import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/cachedimage.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../bloc/categrois/moviegeners_bloc.dart';
import '../widgets/gridfilms.dart';
import '../widgets/topratedfilmbasedoncategrt.dart';


class Categriesdetails extends StatelessWidget {
  const Categriesdetails({super.key, required this.id, this.name});
  final int id;
  final String? name;

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Scaffold(
      body: BlocBuilder<MoviegenersBloc, MoviegenersState>(

        builder: (context, state) {
          if (state is GetmovieGenressucessgstate) {
           
            if (state.movieResponse.results.isNotEmpty) {
               final topratedMovies = state.movieResponse.results.where((movie) => movie.voteAverage > 7).toList();
                     final filteredMovies = state.movieResponse.results.where((movie) => movie.voteAverage < 7).toList();

              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              alignment: Alignment.bottomCenter,
                              height: Screan_size.hieght * .4,
                              width: Screan_size.width,
                    


                              child: 
                                  Cachedimage(
                                    imageUrl: state.movieResponse.results[0].backdropPath??'', 
                                    height: .32, 
                                    width: 1, 
                                    borderraduis: .04,
                                  ),),
                                  Positioned(
                                    bottom: 4,
                                    child: Text(
                                      name.toString(),
                                      style: const TextStyle(color: kwhitecolor, fontSize: 24),
                                    ),
                                  ),
                                Container(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              alignment: Alignment.bottomCenter,
                              height: Screan_size.hieght * .4,
                              width: Screan_size.width,
                                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.2),
                      ],
                    ),
                  ),),
                           Positioned(
                                    bottom: 4,
                                    child: Text(
                                      name.toString(),
                                      style: TextStyle(color: kwhitecolor, fontSize: 24),
                                    ),
                                  ), 
                            Positioned(
                              top: Screan_size.hieght * 0.04,
                              left: Screan_size.width * 0.02,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_rounded,
                                  size: 34,
                                  color: kwhitecolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Screan_size.hieght * 0.0045,
                              left: Screan_size.width * 0.02,
                              bottom: Screan_size.hieght * 0.01,
                            ),
                            child: const Text(
                              'Top Rated 🔥',
                              style: TextStyle(color: kwhitecolor, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: Screan_size.hieght * 0.37,
                      child: Topratedfilmbasedoncategrt(movie:topratedMovies ,),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: Screan_size.hieght * 0.0005,
                          left: Screan_size.width * 0.02,
                          bottom: Screan_size.hieght * 0.01,
                        ),
                        child: const Text(
                          'Films 🔥',
                          style: TextStyle(color: kwhitecolor, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                   Gridfilms(movie: filteredMovies,),
                ],
              );
            } else {
          
              return Center(
                child: Text('No movies found.',style:TextStyle(
                  color: kwhitecolor
                ) ,),
              );
            }
          } else if (state is GetmovieGenresfailurestate) {
            return Center(
              child: Text(state.failure.errMessage,style:TextStyle(
                  color: kwhitecolor
                ) ),
            );
          } else {
            return ShimmerLoading(
              borderraduis: 0,
              height: Screan_size.hieght,
              width: Screan_size.width,
            );
          }
        },
      ),
    );
  }
}
