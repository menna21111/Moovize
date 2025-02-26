import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helper/failure.dart';
import '../../data/model/tvresponse.dart';
import '../../data/repo/tvrepo.dart';


part 'casttv_event.dart';
part 'casttv_state.dart';

class CasttvBloc extends Bloc<CasttvEvent, CasttvState> {
    final Tvrepo tvrepo;
  CasttvBloc( this.tvrepo) : super(CasttvInitial()) {
    
    on<CasttvEvent>((event, emit) async  {
          if (event is GetCasttv) {
        //cast
        emit(TvCastLoading());
        final response = await tvrepo.populartv();

        response.fold(
            (l) => emit(TvCastFailure(l)), (r) => emit(TVCastSuccess(r)));
      }
    });
  }
}
