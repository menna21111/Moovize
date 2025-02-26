import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../../../../core/helper/failure.dart';
import '../../../data/models/generesmodel.dart';
import '../../../data/models/movie_responsemodel.dart';
import '../../../data/repo/genrerepo.dart';



part 'getting_catg_event.dart';
part 'getting_catg_state.dart';

class GettingCatgBloc extends Bloc<GettingCatgEvent, GettingCatgState> {
  final Generrepo generrepo;
  GettingCatgBloc(this.generrepo) : super(GettingCatgInitial()) {
    on<GettingCatgEvent>((event, emit) async {
      if (event is GettvGenres) {
        emit(GettvGenresloadingstate());
        final result = await generrepo.getfilmsgener(event.genreid);
        result.fold((l) {
          emit(GettvGenresfailurestate(l));
        }, (r) {
          emit(GettvGenressucessgstate(r));
        });
      }

     if (event is GetGenresmovie) {
        emit(GetGenresmovieloadingstate());
 final result = await generrepo.getgenremovie();
        result.fold((l) {
          emit(GetGenresmoviefailurestate(l));
        }, (r) {
          emit(GetGenresmoviesuccessstate(r));
        });

      }    
    else if (event is GetGenrestv) {
        emit(GetGenrestvloadingstate());
 final result = await generrepo.getgenretv();
        result.fold((l) {
          emit(GetGenrestvfailurestate(l));
        }, (r) {
          emit(GetGenrestvsucessgstate(r));
        });

      }    
   
   
      
    });
  }
}
