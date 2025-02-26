import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/helper/failure.dart';
import '../../../../../home/data/models/moviemodels/review.dart';
import '../../../../../home/data/repo/movierepo.dart';



part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
   final Movierepo movierepo;
  ReviewBloc(this.movierepo) : super(ReviewInitial()) {
    on<ReviewEvent>((event, emit) async {
      if (event is MovIEGETReview) {
        //review
        emit(MovieReviewsLoading());
        final response = await movierepo.getreviews(event.movieid);

        response.fold((l) => emit(MovieReviewsFailure(l)),
            (r) => emit(MovieReviewsSuccess(r)));
      }
    });
  }
}
