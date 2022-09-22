import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_app/screen_arguments.dart';
import 'package:track_app/screens/choice_screen.dart';
import 'package:track_app/screens/date_birth_screen.dart';
import 'package:track_app/screens/result_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/nav/nav_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(490, 1043),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => NavBloc(),
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: ChoiceScreen.id,
            routes: {
              ChoiceScreen.id: (context) => const ChoiceScreen(),
              DateOfBirthScreen.id: (context) => DateOfBirthScreen(),
              ResultScreen.id: (context) => ResultScreen(),
            },
            home: BlocListener<NavBloc, NavState>(
                listener: (context, state) async {
                  debugPrint('BlocListener -- $state');
                  if (state is ButtonClickedState) {
                    debugPrint(state.props.toString());
                    await Navigator.pushNamed(
                      context,
                      DateOfBirthScreen.id,
                      arguments: state.screenInfo,
                    );
                  } else if (state is NextButtonState) {
                    debugPrint(
                        ' BlocListener_NextButton -> ${state.props.toString()}');
                    var info = state.screenInfo;
                    var year = state.yearDate;
                    await Navigator.pushNamed(context, ResultScreen.id,
                        arguments: ScreenArguments(info, year));
                  }
                },
                child: const ChoiceScreen()),
            // home: const ChoiceScreen(),
          ),
        );
      },
    );
  }
}
