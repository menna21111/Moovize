part of 'toprated_bloc.dart';

@immutable
sealed class TopratedState {}

final class TopratedInitial extends TopratedState {}
final class Loadingtoprated extends TopratedState {

 
}

final class Scucesstoprated extends TopratedState {
  final MovieResponse top;

  Scucesstoprated(this.top);
}

final class Failuretoprated extends TopratedState {
  final Failure failure;

  Failuretoprated(this.failure);
}
