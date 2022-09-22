import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavInitial()) {
    ///this state when one of button clicked in @ChoiceScreen
    on<ButtonClickedEvent>((event, emit) {
      emit(ButtonClickedState(event.buttonInfo));
    });
    ///this state triggers when @DateOfBirthScreen build
    on<DateSelectEvent>((event, emit){
      emit(DateState(event.buttonInfo));
    });
    ///this state triggers when button Next clicked in @DateOfBirthScreen
    on<NextButtonEvent>((event, emit){
      emit(NextButtonState(event.buttonInfo, event.yearDate));
    });
    ///this state triggers when @ResultScreen build
    on<ResultEvent>((event, emit){
      emit(ResultState());
    });
  }
}
