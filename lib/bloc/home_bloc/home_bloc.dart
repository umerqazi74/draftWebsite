import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/common_methods.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial(0)) {
    on<DoSelectDrawerEvent>((event, emit) {
      log("Home bloc fired");
      log("Id : ${event.eventValue.toString()}");
      MySharedPreferences.instance.setIntValue("drawerId", event.eventValue);
      emit(DrawerPageChangeState(event.eventValue));
    });
  }
}
