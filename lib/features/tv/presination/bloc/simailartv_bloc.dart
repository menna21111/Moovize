import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'simailartv_event.dart';
part 'simailartv_state.dart';

class SimailartvBloc extends Bloc<SimailartvEvent, SimailartvState> {
  SimailartvBloc() : super(SimailartvInitial()) {
    on<SimailartvEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
