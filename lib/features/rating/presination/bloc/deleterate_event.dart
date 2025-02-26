part of 'deleterate_bloc.dart';

@immutable
sealed class DeleterateEvent {}

final class Deleterate extends DeleterateEvent {
 final int movieid;
  Deleterate(this.movieid);
}
