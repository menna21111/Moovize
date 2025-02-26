import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/helper/failure.dart';
import '../../../../../data/models/movie_responsemodel.dart';
import '../../../../../data/repo/movierepo.dart';


part 'similiar_event.dart';
part 'similiar_state.dart';

class SimiliarBloc extends Bloc<SimiliarEvent, SimiliarState> {
    final Movierepo movierepo;
  SimiliarBloc(this.movierepo) : super(SimiliarInitial()) {
    on<SimiliarEvent>((event, emit) async{
     if (event is MovIEGETsimilar) {
        //similar
        emit(MovieSIMILARLOADING());
        final response = await movierepo.getsimiliarmov(event.movieid);

        response.fold((l) => emit(MovieSIMILARFALIURE(l)),
            (r) => emit(MovieSIMILARSUCCESS(r)));
      }
    });
  }
}
