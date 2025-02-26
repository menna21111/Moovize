import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/helper/failure.dart';
import '../../../../data/models/movie_responsemodel.dart';
import '../../../../data/repo/homerepo.dart';


part 'toprated_event.dart';
part 'toprated_state.dart';

class TopratedBloc extends Bloc<TopratedEvent, TopratedState> {
  final Homerepo homerepo;
  TopratedBloc(this.homerepo) : super(TopratedInitial()) {
    on<TopratedEvent>((event, emit) async{
      if (event is Gettoprated)  {
        emit(Loadingtoprated());
        final result = await homerepo.gettoprated();
        result.fold((l) {
          emit(Failuretoprated(l));
        }, (r) {
          emit(Scucesstoprated(r));
        });
      }
    });
  }
}
