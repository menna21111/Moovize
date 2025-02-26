part of 'moviebloc_bloc.dart';

@immutable
sealed class MovieblocState {}

final class MovieblocInitial extends MovieblocState {}


//video
// 

//details
final class MovieDetailsLoading extends MovieblocState {}
final class MovieDetailsSuccess extends MovieblocState {

  final MovieDetails data;

  MovieDetailsSuccess(this.data);
}
final class MovieDetailsFailure extends MovieblocState {
   
  final Failure failure;
  
 MovieDetailsFailure (this.failure);    
}
