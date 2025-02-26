part of 'detailstv_bloc.dart';

@immutable
sealed class DetailstvState {}

final class DetailstvInitial extends DetailstvState {}
final class TvDetailsLoading extends DetailstvState {}
final class TvDetailsSuccess extends DetailstvState {

  final TvShowDetails data;

  TvDetailsSuccess(this.data);
}
final class TvDetailsFailure extends DetailstvState {
   
  final Failure failure;
  
 TvDetailsFailure (this.failure);    
}
