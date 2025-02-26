part of 'searchbloc_bloc.dart';

@immutable
sealed class SearchblocEvent {}

class SearchblocEventSearchMOvie extends SearchblocEvent {
  final String query;
   
  SearchblocEventSearchMOvie(this.query);
    
  
}

class SearchblocEventSearchTV extends SearchblocEvent {
  final String query;
   
  SearchblocEventSearchTV(this.query);
}
