part of 'video_bloc.dart';

@immutable
sealed class VideoEvent {}
class MovIdisplayvidao extends VideoEvent {
  final int movieid;

  MovIdisplayvidao(this.movieid);
}
