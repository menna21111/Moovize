part of 'populars_bloc.dart';

@immutable
sealed class PopularsState {}

final class PopularsInitial extends PopularsState {}
final class Loadingpopular extends PopularsState {}

final class Scucesspopular extends PopularsState {
  final MovieResponse popular;

  Scucesspopular(this.popular);
}

final class Failurepopular extends PopularsState {
  final Failure failure;

  Failurepopular(this.failure);
}