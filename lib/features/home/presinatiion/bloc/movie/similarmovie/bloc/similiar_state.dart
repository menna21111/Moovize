part of 'similiar_bloc.dart';

@immutable
sealed class SimiliarState {}

final class SimiliarInitial extends SimiliarState {}
final class MovieSIMILARLOADING extends SimiliarState {}
final class MovieSIMILARSUCCESS extends SimiliarState {
  final MovieResponse data;

  MovieSIMILARSUCCESS(this.data);
}
final class MovieSIMILARFALIURE extends SimiliarState {

  final Failure failure;

  MovieSIMILARFALIURE(this.failure);
}