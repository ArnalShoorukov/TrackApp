import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavInitial()) {
    ///changes state when button clicked
    on<ButtonClickedEvent>((event, emit) {
      emit(ButtonClickedState(event.buttonInfo));
    });
    ///emits state when @DateSelectScreen build
    on<DateSelectEvent>((event, emit){
      emit(DateState(event.buttonInfo));
    });
    ///emits state nextbutton when even button clicked triggered
    on<NextButtonEvent>((event, emit){
      emit(NextButtonState(event.buttonInfo, event.yearDate));
    });
    ///emits state when @ResultScreen build
    on<ResultEvent>((event, emit){
      emit(ResultState());
    });
  }
}
