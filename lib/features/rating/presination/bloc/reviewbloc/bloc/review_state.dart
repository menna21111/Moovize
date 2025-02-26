part of 'review_bloc.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}
final class MovieReviewsLoading extends ReviewState {}
final class MovieReviewsSuccess extends ReviewState {

  final ReviewResponse data;

  MovieReviewsSuccess(this.data);
}
final class MovieReviewsFailure extends ReviewState {
   
  final Failure failure;
  
 MovieReviewsFailure (this.failure);    
}
