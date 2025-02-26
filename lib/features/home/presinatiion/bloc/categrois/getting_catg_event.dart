part of 'getting_catg_bloc.dart';

@immutable
sealed class GettingCatgEvent {}

class GetGenresmovie extends GettingCatgEvent {}
class GetGenrestv extends GettingCatgEvent {}

class GettvGenres extends GettingCatgEvent {
  final int genreid;
    
  GettvGenres(this.genreid); 
}