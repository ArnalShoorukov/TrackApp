import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavInitial()) {
    on<ButtonClickedEvent>((event, emit) {
      debugPrint(event.buttonInfo);
      emit(ButtonClickedState(event.buttonInfo));
    });
    on<DateEvent>((event, emit){
      emit(DateState(event.buttonInfo));
    });
    on<NextButtonEvent>((event, emit){
      emit(NextButtonState(event.buttonInfo, event.yearDate));
    });
    on<ResultEvent>((event, emit){
      emit(ResultState());
    });
  }
}
