part of 'nav_bloc.dart';

abstract class NavState extends Equatable {
  const NavState();

  @override
  List<Object> get props => [];
}

class NavInitial extends NavState {
  @override
  List<Object> get props => [];
}
///this state when one of button clicked in @ChoiceScreen
class ButtonClickedState extends NavState {
  final String screenInfo;
  const ButtonClickedState(this.screenInfo);
  @override
  List<Object> get props => [screenInfo];
}
///this state triggers when @DateOfBirthScreen build
class DateState extends NavState {
  final String screenInfo;
  const DateState(this.screenInfo);
  @override
  List<Object> get props => [screenInfo];
}
///this state triggers when button Next clicked in @DateOfBirthScreen
class NextButtonState extends NavState {
  final String screenInfo;
  final String yearDate;
  const NextButtonState(this.screenInfo, this.yearDate);
  @override
  List<Object> get props => [screenInfo, yearDate];
}

class ResultState extends NavState {}
