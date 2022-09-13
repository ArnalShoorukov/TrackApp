import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      builder: (context , child) {
        return BlocProvider(
            create:(_)=> NavBloc(),
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const ChoiceScreen(),
          ),
        );
      },
    );

  }
}