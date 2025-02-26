part of 'cast_bloc.dart';

@immutable
sealed class CastEvent {}
class MovIEGETCast extends CastEvent {
  final int movieid;

  MovIEGETCast(this.movieid);
}