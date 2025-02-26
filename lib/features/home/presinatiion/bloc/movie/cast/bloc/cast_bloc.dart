import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/helper/failure.dart';
import '../../../../../data/models/moviemodels/castmodel.dart';
import '../../../../../data/repo/movierepo.dart';


part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
   final Movierepo movierepo;
  CastBloc(this.movierepo) : super(CastInitial()) {
    on<CastEvent>((event, emit) async{
    if (event is MovIEGETCast) {
        //cast
        emit(MovieCastLoading());
        final response = await movierepo.getcast(event.movieid);

        response.fold(
            (l) => emit(MovieCastFailure(l)), (r) => emit(MovieCastSuccess(r)));
      }
    });
  }
}
