import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/nav/nav_bloc.dart';
import '../helpers.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.screenInfo, required this.year});

  final String screenInfo;
  final String year;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NavBloc>(context).add(ResultEvent());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result is:',
              style: GoogleFonts.nunito(textStyle: Helpers.style),
            ),
            SizedBox(height: 20.h),
            Text(
              screenInfo,
              style: GoogleFonts.nunito(textStyle: Helpers.style2),
            ),
            SizedBox(height: 20.h),
            Text(
              year,
              style: GoogleFonts.nunito(textStyle: Helpers.style2),
            ),
            SizedBox(height: 50.h),
            Text(
              'Have a nice Day ;-)',
              style: GoogleFonts.nunito(textStyle: Helpers.style2),
            ),
          ],
        ),
      ),
    );
  }
}
