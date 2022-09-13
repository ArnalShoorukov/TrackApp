part of 'nav_bloc.dart';

abstract class NavEvent extends Equatable {
  const NavEvent();
  @override
  List<Object> get props => [];
}

class ButtonClickedEvent extends NavEvent{
  const ButtonClickedEvent(this.buttonInfo);
  final String buttonInfo;
  @override
  List<Object> get props => [buttonInfo];
}

class DateEvent extends NavEvent{
  const DateEvent(this.buttonInfo);
  final String buttonInfo;
  @override
  List<Object> get props => [buttonInfo];
}
class NextButtonEvent extends NavEvent{
  const NextButtonEvent(this.buttonInfo, this.yearDate);
  final String buttonInfo;
  final String yearDate;
  @override
  List<Object> get props => [buttonInfo, yearDate];
}
class ResultEvent extends NavEvent{}