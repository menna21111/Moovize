import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helper/failure.dart';
import '../../data/models/addrate.dart';
import '../../data/repo/raterepo.dart';

part 'deleterate_event.dart';
part 'deleterate_state.dart';

class DeleterateBloc extends Bloc<DeleterateEvent, DeleterateState> {
  final Raterepo raterebo;
  DeleterateBloc(this.raterebo) : super(DeleterateInitial()) {
    on<DeleterateEvent>((event, emit) async {
      if (event is Deleterate) {
        emit(DeleteratingLoading());
        final res = await raterebo.deleterating(event.movieid);
        res.fold((l) => emit(Deleteratingfailure(l)),
            (r) => emit(Deleteratingscuess(r)));
      }
    });
  }
}
