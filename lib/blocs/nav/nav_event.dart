part of 'nav_bloc.dart';

abstract class ScreenNavigationEvent extends Equatable {
  const ScreenNavigationEvent();
  @override
  List<Object> get props => [];
}

/// this state when one of button clicked in [ChoiceScreen]
class ChoiceScreenNavigationEvent extends ScreenNavigationEvent {
  /// we have nothing to store here yet
  final NotificationChoice notificationChoice;
  const ChoiceScreenNavigationEvent(this.notificationChoice);
  @override
  List<Object> get props => [notificationChoice];
}

///this state triggers when [DateOfBirthScreen] build
class DateScreenNavigationEvent extends ScreenNavigationEvent {
  final NotificationChoice notificationChoice;
  final String yearOfBirth;

  const DateScreenNavigationEvent({
    required this.notificationChoice,
    required this.yearOfBirth,
  });
  @override
  List<Object> get props => [notificationChoice, yearOfBirth];
}
