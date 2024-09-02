import 'package:bloc/bloc.dart';
import 'package:draft_website/api/repository/player_data_repository.dart';
import 'package:draft_website/api/response/player_data_response.dart';
import 'package:meta/meta.dart';

part 'player_event.dart';

part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerInitial()) {
    on<DoGetPlayersDataEvent>((event, emit) async {
      print("Do get players data bloc");
      emit(GetPlayersLoadingState());
      var responseData = await PlayersDataRepository(isDraftPage: event.isDraftPage).getPlayersData();
      PlayersDataResponse playersDataResponse =
          PlayersDataResponse.fromJson(responseData);
      print(responseData);
      if (playersDataResponse.error == true) {
        emit(
          GetPlayersFailureState(
            failureMsg: "Some error occur",
          ),
        );
      } else {
        emit(
          GetPlayersSuccessState(
            successMsg: "Success",
            listPlayers: playersDataResponse.tokens!,
          ),
        );
      }
    });
  }






}
