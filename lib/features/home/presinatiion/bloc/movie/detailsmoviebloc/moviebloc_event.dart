part of 'moviebloc_bloc.dart';

@immutable
sealed class MovieblocEvent {}




class MovIEGETDetail extends MovieblocEvent {
  final int movieid;

  MovIEGETDetail(this.movieid);
}
class MovIEAddrating extends MovieblocEvent {}
class MovIEDeleterating extends MovieblocEvent {}
  

