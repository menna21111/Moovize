import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helper/failure.dart';
import '../../data/models/addrate.dart';
import '../../data/repo/raterepo.dart';

part 'addrating_event.dart';
part 'addrating_state.dart';

class AddratingBloc extends Bloc<AddratingEvent, AddratingState> {
  final Raterepo raterebo;
  AddratingBloc(this.raterebo) : super(AddratingInitial()) {
    on<AddratingEvent>((event, emit) async {
      if (event is AddRate) {
        emit(AddratingLoading());
        final res = await raterebo.addrating(event.movieid, event.rate);
        res.fold((l) => Addratingfailure(l), (r) => Addratingscuess(r));
      }
    });
  }
}
