part of 'addrating_bloc.dart';

@immutable
sealed class AddratingEvent {}

 class AddRate extends AddratingEvent {
  final double  rate;
  int movieid;
  AddRate(this.movieid, this.rate);
}
