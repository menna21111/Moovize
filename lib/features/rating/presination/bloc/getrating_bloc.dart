import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helper/failure.dart';
import '../../data/models/getrating.dart';
import '../../data/repo/raterepo.dart';



part 'getrating_event.dart';
part 'getrating_state.dart';

class GetratingBloc extends Bloc<GetratingEvent, GetratingState> {
    final Raterepo raterebo;
  GetratingBloc(this.raterebo) : super(GetratingInitial()) {
    on<GetratingEvent>((event, emit)async {
      if (event is Getrate) {
        emit(GetratingLoading());
        final res = await raterebo.isRated();
       res.fold(
    (failure) => emit(Getratingfailure(failure)),
    (ratedMovies) => emit(Getratingscuess(ratedMovies)),
  );
      }
    });
  }
}
