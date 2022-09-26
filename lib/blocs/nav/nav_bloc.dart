import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_app/helpers.dart';
import 'package:track_app/screens/choice_screen.dart';
import 'package:track_app/screens/date_birth_screen.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class ScreenNavigationBloc
    extends Bloc<ScreenNavigationEvent, ScreenNavigationState> {
  ScreenNavigationBloc() : super(const ChoiceScreenNavigationState()) {
    ///changes state when button clicked
    on<ChoiceScreenNavigationEvent>(
      (event, emit) => emit(
        DateScreenNavigationState(event.notificationChoice),
      ),
    );

    ///emits state when @DateSelectScreen build
    on<DateScreenNavigationEvent>(
      (event, emit) => emit(
        ResultScreenNavigationState(
          notificationChoice: event.notificationChoice,
          yearOfBirth: event.yearOfBirth,
        ),
      ),
    );
  }

  void selectNotificationType(NotificationChoice notificationChoice) => add(
        ChoiceScreenNavigationEvent(
          notificationChoice,
        ),
      );

  void selectYearOfBirth({
    required NotificationChoice notificationChoice,
    required String yearOfBirth,
  }) =>
      add(
        DateScreenNavigationEvent(
          notificationChoice: notificationChoice,
          yearOfBirth: yearOfBirth,
        ),
      );
}
