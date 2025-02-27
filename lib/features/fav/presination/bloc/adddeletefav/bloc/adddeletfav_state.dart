part of 'adddeletfav_bloc.dart';

@immutable
sealed class AdddeletfavState {}

final class AdddeletfavInitial extends AdddeletfavState {}
final class Adddeletsucess extends AdddeletfavState {
  final List <Movie> movies;

  Adddeletsucess(this.movies);
}
final class AdddeletfavFailure extends AdddeletfavState {
  final String erorrMessage;

  AdddeletfavFailure(this.erorrMessage);
}
final class AdddeletfavLoading extends AdddeletfavState {}
