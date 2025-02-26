part of 'moviegeners_bloc.dart';

@immutable
sealed class MoviegenersEvent {}
class GetmovieGenres extends MoviegenersEvent {
  final int genreid;

  GetmovieGenres(this.genreid);
}