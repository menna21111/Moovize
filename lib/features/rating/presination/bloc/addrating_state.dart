part of 'addrating_bloc.dart';

@immutable
sealed class AddratingState {}

final class AddratingInitial extends AddratingState {}

final class AddratingLoading extends AddratingState {}

final class Addratingscuess extends AddratingState {
  final AddRatingResponse addRatingResponse;
  Addratingscuess(this.addRatingResponse);
}

final class Addratingfailure extends AddratingState {
  final Failure err;
  Addratingfailure(this.err);
}
