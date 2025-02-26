part of 'moviegeners_bloc.dart';

@immutable
sealed class MoviegenersState {}

final class MoviegenersInitial extends MoviegenersState {}
final class GetmovieGenresloadingstate extends MoviegenersState {}
final class GetmovieGenressucessgstate extends MoviegenersState {
  final MovieResponse movieResponse;

  GetmovieGenressucessgstate(this.movieResponse);
}
final class GetmovieGenresfailurestate extends MoviegenersState {
  final Failure failure;

  GetmovieGenresfailurestate(this.failure);
}