part of 'review_bloc.dart';

@immutable
sealed class ReviewEvent {}
class MovIEGETReview extends ReviewEvent {
  final int movieid;

  MovIEGETReview(this.movieid);
}