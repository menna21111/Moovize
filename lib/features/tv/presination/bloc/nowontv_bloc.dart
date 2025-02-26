import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helper/failure.dart';
import '../../data/model/tvresponse.dart';
import '../../data/repo/tvrepo.dart';


part 'nowontv_event.dart';
part 'nowontv_state.dart';

class NowontvBloc extends Bloc<NowontvEvent, NowontvState> {
   final Tvrepo tvrepo;
  NowontvBloc(this.tvrepo) : super(NowontvInitial()) {
    on<NowontvEvent>((event, emit) async{
     if (event is NowontvvEvent) {

        emit(Nowontvloading());
        final result = await tvrepo.nowontv();
        result.fold((l) {
          emit(Nowontvfailure(l));
        }, (r) {
          emit(Nowontvscucess(r));

        });
      }
    });
  }
}
