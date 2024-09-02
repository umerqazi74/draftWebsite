part of 'player_bloc.dart';

@immutable
abstract class PlayerState {}

class PlayerInitial extends PlayerState {}

class GetPlayersLoadingState extends PlayerState {}

class GetPlayersSuccessState extends PlayerState {
  final String successMsg;
  final List<Tokens> listPlayers;

  GetPlayersSuccessState({
    required this.successMsg,
    required this.listPlayers,
  });
}

class GetPlayersFailureState extends PlayerState {
  final String failureMsg;

  GetPlayersFailureState({required this.failureMsg});
}
