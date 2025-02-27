import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../../../home/presinatiion/views/screan/filmscreanbody.dart';
import '../../bloc/get/fav_bloc.dart';
import '../widget/customviewitem.dart';


class Favscrean extends StatelessWidget {
  const Favscrean({super.key});

  @override

  Widget build(BuildContext context) {
    context.read<FavBloc>().add(GetFavEvent());
    return Scaffold(
      appBar: AppBar(
   
        title: const Text(
          'Faviortes',
          style: TextStyle( fontSize: 25,fontWeight: FontWeight.bold ),
        ),
        actions: [
          Title(color: kblackcolor, child: Image.asset('assets/images/logo (2).png')),
        ],
      ),
      body: BlocBuilder<FavBloc, FavState>(builder: (context, state) {
        if (state is Favscuess) {
          if (state.movieDetails.isEmpty) {
            return const Center(
              child: Text(
                'No Favourites yet',

              ),
            );
          } else {
            return ListView.builder(
              itemCount: state.movieDetails.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Filmscreanbody(id:state.movieDetails[index].id ?? 278 ,movie:state.movieDetails[index] ,)));
                    },
                    child: CustomMovieItem(
                      movie: state.movieDetails[index],
                    ),
                  ),
                );
              },
            );
          }
        } else if (state is FavFail) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: kwhitecolor),
            ),
          );
        } else {
          return ShimmerLoading(width: 1, borderraduis: 0, height: 1);
        }
      }),
    );
  }
}