part of 'getting_catg_bloc.dart';

@immutable
sealed class GettingCatgState {}

final class GettingCatgInitial extends GettingCatgState {}
//genres movie
final class GetGenresmovieloadingstate extends GettingCatgState {}
final class GetGenresmoviesuccessstate extends GettingCatgState {

  final GenreResponse genreResponse;

  GetGenresmoviesuccessstate(this.genreResponse);
}
final class GetGenresmoviefailurestate extends GettingCatgState {
  final Failure failure;

  GetGenresmoviefailurestate(this.failure);
}
//genres tv
final class GetGenrestvloadingstate extends GettingCatgState {}
final class GetGenrestvsucessgstate extends GettingCatgState {

  final GenreResponse genreResponse;

  GetGenrestvsucessgstate(this.genreResponse);

}

final class GetGenrestvfailurestate extends GettingCatgState {
  final Failure failure;

  GetGenrestvfailurestate(this.failure);
}


final class GettvGenresloadingstate extends GettingCatgState {}
final class GettvGenressucessgstate extends GettingCatgState {

   final MovieResponse movieResponse;

  GettvGenressucessgstate(this.movieResponse);
}
final class GettvGenresfailurestate extends GettingCatgState {
  final Failure failure;

  GettvGenresfailurestate(this.failure);
}
