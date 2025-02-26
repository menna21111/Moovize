part of 'similiar_bloc.dart';

@immutable
sealed class SimiliarEvent {}
class MovIEGETsimilar extends SimiliarEvent 
{
   final int movieid;
  MovIEGETsimilar(this.movieid);
}