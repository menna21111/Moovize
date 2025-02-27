import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../home/data/models/movie_responsemodel.dart';
import '../../../../home/data/models/moviemodels/moviedetails.dart';
import '../../../data/repo/favrepo.dart';

part 'fav_event.dart';
part 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
    final FavRepoImpl? favRepoImpl;
  FavBloc( {this.favRepoImpl}) : super(FavInitial()) {
    on<FavEvent>((event, emit)async {
      if (event is GetFavEvent) {
        emit(FavLoading());
        try{
var data=await favRepoImpl!.getfavorites();
log('$data');
emit(Favscuess(movieDetails: data, ));

        }catch(e){
          emit(FavFail(e.toString()));
        }
      }
    });
  }
}
