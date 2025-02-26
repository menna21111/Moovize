part of 'getrating_bloc.dart';

@immutable
sealed class GetratingState {}

final class GetratingInitial extends GetratingState {}
final class GetratingLoading extends GetratingState {}

final class Getratingscuess extends GetratingState {
  final RatedMoviesResponse getrate;
  Getratingscuess(this.getrate);
}

final class Getratingfailure extends GetratingState {
  final Failure err;
  Getratingfailure(this.err);
}