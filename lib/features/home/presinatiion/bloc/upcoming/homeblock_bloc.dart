import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



import '../../../../../core/helper/failure.dart';
import '../../../data/models/movie_responsemodel.dart';
import '../../../data/repo/homerepo.dart';

part 'homeblock_event.dart';
part 'homeblock_state.dart';

class HomeblockBloc extends Bloc<HomeblockEvent, HomeblockState> {
  final Homerepo homerepo;
  HomeblockBloc(this.homerepo) : super(HomeblockInitial()) {
    on<HomeblockEvent>((event, emit) async {
      if (event is Getupcoming) {
        emit(Loadingupcoming());
        final result = await homerepo.getpopular();
        result.fold((l) {
          emit(Failureupcoming(l));
        }, (r) {
          emit(Scucessupcoming(r));
        });
      }
      //  else if (event is Gettoprated) {
      //   emit(Loadingtoprated());
      //   final result = await homerepo.gettoprated();
      //   result.fold((l) {
      //     emit(Failuretoprated(l));
      //   }, (r) {
      //     emit(Scucesstoprated(r));
      //   });
      // } else if (event is Getpopular) {
      //   emit(Loadingpopular());
      //   final result = await homerepo.getpopular();
      //   result.fold((l) {
      //     emit(Failurepopular(l));
      //   }, (r) {
      //     emit(Scucesspopular(r));

      //   });
      // }
    });
  }
}
