import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../fav/presination/bloc/get/fav_bloc.dart';
import '../../../data/models/movie_responsemodel.dart';
import '../../bloc/movie/cast/bloc/cast_bloc.dart';
import '../../bloc/movie/detailsmoviebloc/moviebloc_bloc.dart';
import '../../bloc/movie/similarmovie/bloc/similiar_bloc.dart';
import 'filmscrean.dart';



class Filmscreanbody extends StatelessWidget {
  const Filmscreanbody({super.key, required this.id, required this.movie});
  final int id;
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    context
        .read<MovieblocBloc>()
        .add(MovIEGETDetail(id));
    context
        .read<FavBloc>()
        .add(GetFavEvent());
    context
        .read<CastBloc>()
        .add(MovIEGETCast(id));
    context
        .read<SimiliarBloc>()
        .add(MovIEGETsimilar(id));
    return Filmscrean(movie:movie ,);
  }
}
