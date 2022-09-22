part of 'nav_bloc.dart';

abstract class NavEvent extends Equatable {
  const NavEvent();
  @override
  List<Object> get props => [];
}

/// this event triggers when one of the 2 buttons is clicked
class ButtonClickedEvent extends NavEvent{
  const ButtonClickedEvent(this.buttonInfo);
  final String buttonInfo;
  @override
  List<Object> get props => [buttonInfo];
}

/// This Event triggers when {@DateOfBirth} screen builds
class DateSelectEvent extends NavEvent{
  const DateSelectEvent(this.buttonInfo);
  final String buttonInfo;
  @override
  List<Object> get props => [buttonInfo];
}
///This Event triggers when button next clicks in {@DateOfBirth}
class NextButtonEvent extends NavEvent{
  const NextButtonEvent(this.buttonInfo, this.yearDate);
  final String buttonInfo;
  final String yearDate;
  @override
  List<Object> get props => [buttonInfo, yearDate];
}

///This Event triggers when {@ResultScreen} is build
class ResultEvent extends NavEvent{}