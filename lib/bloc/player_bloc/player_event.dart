part of 'player_bloc.dart';

@immutable
abstract class PlayerEvent {}

class DoGetPlayersDataEvent extends PlayerEvent {
  final bool? isDraftPage;
  DoGetPlayersDataEvent({this.isDraftPage});
}
