part of 'adddeletfav_bloc.dart';

@immutable
sealed class AdddeletfavEvent {}

class AddfavEventAdd extends AdddeletfavEvent {
 final Movie movieid;

  AddfavEventAdd(this.movieid);
}
class DeletefavEventAdd extends AdddeletfavEvent {
 final Movie movieid;

  DeletefavEventAdd(this.movieid);
}
