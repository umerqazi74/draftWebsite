part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  final int index;

  const HomeState(this.index);

  @override
  List<Object> get props => [index];
}

class HomeInitial extends HomeState {
  const HomeInitial(index) : super(index);

}

class DrawerPageChangeState extends HomeState {
  const DrawerPageChangeState(index) : super(index);

}
