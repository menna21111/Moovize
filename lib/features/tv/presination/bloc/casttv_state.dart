part of 'casttv_bloc.dart';

@immutable
sealed class CasttvState {}

final class CasttvInitial extends CasttvState {}
  final class TvCastLoading extends CasttvState {}
final class TVCastSuccess extends CasttvState {
  final TVShowResponse  data;

 TVCastSuccess(this.data);
}
final class TvCastFailure extends CasttvState {
  final Failure failure;

  TvCastFailure(this.failure);
}