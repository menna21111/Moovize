part of 'homeblock_bloc.dart';

@immutable
sealed class HomeblockState {}

final class HomeblockInitial extends HomeblockState {}

final class Loadingupcoming extends HomeblockState {}

final class Scucessupcoming extends HomeblockState {
  final MovieResponse upcoming;

  Scucessupcoming(this.upcoming);
}

final class Failureupcoming extends HomeblockState {
  final Failure failure;

  Failureupcoming(this.failure);
}

// final class Loadingtoprated extends HomeblockState {

 
// }

// final class Scucesstoprated extends HomeblockState {
//   final MovieResponse top;

//   Scucesstoprated(this.top);
// }

// final class Failuretoprated extends HomeblockState {
//   final Failure failure;

//   Failuretoprated(this.failure);
// }

// final class Loadingpopular extends HomeblockState {}

// final class Scucesspopular extends HomeblockState {
//   final MovieResponse popular;

//   Scucesspopular(this.popular);
// }

// final class Failurepopular extends HomeblockState {
//   final Failure failure;

//   Failurepopular(this.failure);
// }
