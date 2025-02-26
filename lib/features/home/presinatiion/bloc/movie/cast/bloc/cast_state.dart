part of 'cast_bloc.dart';

@immutable
sealed class CastState {}

final class CastInitial extends CastState {}
final class MovieCastLoading extends CastState {}
final class MovieCastSuccess extends CastState {
  final CastResponse data;

  MovieCastSuccess(this.data);
}
final class MovieCastFailure extends CastState {
  final Failure failure;

  MovieCastFailure(this.failure);
}
