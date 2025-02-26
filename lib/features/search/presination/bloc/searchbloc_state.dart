part of 'searchbloc_bloc.dart';

@immutable
sealed class SearchblocState {}

final class SearchblocInitial extends SearchblocState {}

final class Searchtvloading extends SearchblocState {}

final class Searchtvsuccess extends SearchblocState {
  final SearchmodelResponse data;

  Searchtvsuccess(this.data);
}

final class Searchtvfailure extends SearchblocState {
  final Failure e;

  Searchtvfailure(this.e);
}

final class Searchmovieloading extends SearchblocState {}

final class Searchmoviesuccess extends SearchblocState {
  final SearchmodelResponse data;
 
  
  Searchmoviesuccess(this.data); 
}

final class Searchmoviefailure extends SearchblocState {
  final Failure e;

  Searchmoviefailure(this.e);
}
