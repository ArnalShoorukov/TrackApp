import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers.dart';

class ResultScreen extends StatelessWidget {
  static const String id = '/result_screen';

  final NotificationChoice notificationChoice;
  final String yearOfBirth;

  const ResultScreen({
    required this.notificationChoice,
    required this.yearOfBirth,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
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
                notificationChoice.name,
                style: GoogleFonts.nunito(textStyle: Helpers.style2),
              ),
              SizedBox(height: 20.h),
              Text(
                yearOfBirth,
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
