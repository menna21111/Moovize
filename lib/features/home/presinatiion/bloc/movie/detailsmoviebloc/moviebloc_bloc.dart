import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/helper/failure.dart';
import '../../../../data/models/moviemodels/moviedetails.dart';
import '../../../../data/repo/movierepo.dart';

part 'moviebloc_event.dart';
part 'moviebloc_state.dart';

class MovieblocBloc extends Bloc<MovieblocEvent, MovieblocState> {
  final Movierepo movierepo;
  MovieblocBloc(this.movierepo) : super(MovieblocInitial()) {
    on<MovieblocEvent>((event, emit) async {
      if (event is MovIEGETDetail) {
        //details
        emit(MovieDetailsLoading());
        final response = await movierepo.getdetailsmov(event.movieid);

        response.fold((l) => emit(MovieDetailsFailure(l)),
            (r) => emit(MovieDetailsSuccess(r)));
      }  
    });
  }
}
