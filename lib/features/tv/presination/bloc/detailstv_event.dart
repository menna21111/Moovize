part of 'detailstv_bloc.dart';

@immutable
sealed class DetailstvEvent {}
class TvGETDetail extends DetailstvEvent {
  final int tvid;

  TvGETDetail(this.tvid);
}