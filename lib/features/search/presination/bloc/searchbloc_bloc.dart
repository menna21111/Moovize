import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helper/failure.dart';
import '../../data/model/searchmodel.dart';
import '../../data/repo/searchrepo.dart';


part 'searchbloc_event.dart';
part 'searchbloc_state.dart';

class SearchblocBloc extends Bloc<SearchblocEvent, SearchblocState> {
  final Searchrepo searchrepo;
  SearchblocBloc(this.searchrepo) : super(SearchblocInitial()) {
    on<SearchblocEvent>((event, emit) async {
      //search movie
      if (event is SearchblocEventSearchMOvie) {
        emit(Searchmovieloading());
        final result = await searchrepo.searchfilm(event.query);
        result.fold((l) {
          emit(Searchmoviefailure(l));
        }, (r) {
          emit(Searchmoviesuccess(r));
        });
      }
      //search tv
       else if (event is SearchblocEventSearchTV) {
         emit(Searchtvloading());
        final result = await searchrepo.searchfilm(event.query);
        result.fold((l) {
          emit(Searchtvfailure(l));
        }, (r) {
          emit(Searchtvsuccess(r));
        });
      }
    });
  }
}
