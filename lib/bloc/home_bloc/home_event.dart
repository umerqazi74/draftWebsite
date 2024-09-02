part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class DoSelectDrawerEvent extends HomeEvent {
  final int eventValue;

  const DoSelectDrawerEvent(this.eventValue);

  @override
  List<Object> get props => [eventValue];
}
