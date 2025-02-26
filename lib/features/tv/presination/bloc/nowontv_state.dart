part of 'nowontv_bloc.dart';

@immutable
sealed class NowontvState {}

final class NowontvInitial extends NowontvState {}
final class Nowontvloading extends NowontvState {}
final class Nowontvscucess extends NowontvState {
  final TVShowResponse nowontv;
     
  Nowontvscucess(this.nowontv); 
  
}
final class Nowontvfailure extends NowontvState {
  final Failure failure;

  Nowontvfailure(this.failure);
}
