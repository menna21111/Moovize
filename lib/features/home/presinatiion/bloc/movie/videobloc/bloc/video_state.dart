part of 'video_bloc.dart';

@immutable
sealed class VideoState {}

final class VideoInitial extends VideoState {}
//video
final class MovieVIDEOLOADING extends VideoState {}
final class MovieVIDEOSUCCESS extends VideoState {
  final VideoResponse data;

  MovieVIDEOSUCCESS(this.data);
}
final class MovieVIDEOFALIURE extends VideoState {

  final Failure failure;

  MovieVIDEOFALIURE(this.failure);
}
