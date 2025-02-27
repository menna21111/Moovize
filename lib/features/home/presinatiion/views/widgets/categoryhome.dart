import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../bloc/categrois/getting_catg_bloc.dart';
import '../../bloc/categrois/moviegeners_bloc.dart';
import '../screan/categriesdetails.dart';




class Categoryiesh extends StatelessWidget {
  const Categoryiesh({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return BlocBuilder<GettingCatgBloc, GettingCatgState>(
      builder: (context, state) {
        if (state is GetGenresmoviesuccessstate) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.genreResponse.genres.length,
            itemBuilder: (context, index) {
              if (state.genreResponse.genres[index].name != 'Romance') {
                return GestureDetector(
                  onTap: () {
                    print(state.genreResponse.genres[index].id);
                    context.read<MoviegenersBloc>().add(
                        GetmovieGenres(state.genreResponse.genres[index].id));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Categriesdetails(
                        id: state.genreResponse.genres[index].id,
                        name: state.genreResponse.genres[index].name,
                      );
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Screan_size.width * .074),
                    margin: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kgreycolor.shade100.withOpacity(.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      state.genreResponse.genres[index].name,
                   
                    ),
                  ),
                );
              }
            },
          );
        } else if (state is GetGenresmoviefailurestate) {
          return Center(
            child: Text(state.failure.errMessage),
          );
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShimmerLoading(height: .2, width: .2, borderraduis: .02),
              );
            },
          );
        }
      },
    );
  }
}
