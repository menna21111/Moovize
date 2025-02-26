part of 'deleterate_bloc.dart';

@immutable
sealed class DeleterateState {}

final class DeleterateInitial extends DeleterateState {}
final class DeleteratingLoading extends DeleterateState {}

final class Deleteratingscuess extends DeleterateState {
  final AddRatingResponse addRatingResponse;
  Deleteratingscuess(this.addRatingResponse);
}

final class Deleteratingfailure extends DeleterateState {
  final Failure err;
  Deleteratingfailure(this.err);
}