import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/helper/failure.dart';
import '../../../../../data/models/moviemodels/videomodel.dart';
import '../../../../../data/repo/movierepo.dart';



part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
   final Movierepo movierepo;

  VideoBloc(this.movierepo) : super(VideoInitial()) {
    on<VideoEvent>((event, emit) async{
      if (event is MovIdisplayvidao) {
        //video
        emit(MovieVIDEOLOADING());
        final response = await movierepo.displayvideo(event.movieid);

        response.fold((l) => emit(MovieVIDEOFALIURE(l)),
            (r) => emit(MovieVIDEOSUCCESS(r)));
      }
    });
  }
}
