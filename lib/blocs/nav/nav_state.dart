part of 'nav_bloc.dart';

abstract class ScreenNavigationState extends Equatable {
  const ScreenNavigationState();

  @override
  List<Object> get props => [];
}

/// this state when one of button clicked in [ChoiceScreen]
class ChoiceScreenNavigationState extends ScreenNavigationState {
  /// we have nothing to store here yet
  const ChoiceScreenNavigationState();
}

///this state triggers when [DateOfBirthScreen] build
class DateScreenNavigationState extends ScreenNavigationState {
  final NotificationChoice notificationChoice;
  const DateScreenNavigationState(this.notificationChoice);
  @override
  List<Object> get props => [notificationChoice];
}

///this state triggers when button Next clicked in [DateOfBirthScreen]
class ResultScreenNavigationState extends ScreenNavigationState {
  final NotificationChoice notificationChoice;
  final String yearOfBirth;

  const ResultScreenNavigationState({
    required this.notificationChoice,
    required this.yearOfBirth,
  });
  @override
  List<Object> get props => [notificationChoice, yearOfBirth];
}
