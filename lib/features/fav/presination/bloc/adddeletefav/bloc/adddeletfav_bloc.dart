import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moovize/features/fav/data/models/moviedetails.dart';

import '../../../../../home/data/models/movie_responsemodel.dart';
import '../../../../../home/data/models/moviemodels/moviedetails.dart';
import '../../../../data/repo/favrepo.dart';

part 'adddeletfav_event.dart';
part 'adddeletfav_state.dart';

class AdddeletfavBloc extends Bloc<AdddeletfavEvent, AdddeletfavState> {
  final FavRepoImpl? favRepoImpl;
  AdddeletfavBloc({this.favRepoImpl}) : super(AdddeletfavInitial()) {
    on<AdddeletfavEvent>((event, emit) async {
      if (event is AddfavEventAdd) {
        emit(AdddeletfavLoading());
        try {
  var result = await favRepoImpl!.additemtofavorites(event.movieid);

  emit(Adddeletsucess(result));
} catch (e) {
  emit(AdddeletfavFailure(e.toString()));
}
   
      }
    
    
   
    else  if (event is DeletefavEventAdd) {
        emit(AdddeletfavLoading());
        try {
  var result = await favRepoImpl!.deleteitemfromfavorites(event.movieid);

  emit(Adddeletsucess(result));
} catch (e) {
  emit(AdddeletfavFailure(e.toString()));
}
   
      }
    });
  }
}
