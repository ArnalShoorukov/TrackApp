import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_app/blocs/nav/nav_bloc.dart';
import '../helpers.dart';

class DateOfBirthScreen extends StatefulWidget {
  static const String id = '/date_of_birth_screen';

  const DateOfBirthScreen({super.key});

  @override
  State<DateOfBirthScreen> createState() => _DateOfBirthScreenState();
}

class _DateOfBirthScreenState extends State<DateOfBirthScreen> {
  late String screenInfo;
  final double _kItemExtent = 67.0;
  final List<String> _years = <String>[
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
  ];
  String selectedYear = '1990';

  @override
  Widget build(BuildContext context) {
    final navigationBloc = context.read<ScreenNavigationBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.all(32.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Log in your date of birth',
                    style: GoogleFonts.nunito(textStyle: Helpers.style)),
                SizedBox(
                  height: 250.h,
                  child: CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        selectedYear = _years[selectedItem];
                        debugPrint(selectedYear);
                      });
                    },
                    children: List<Widget>.generate(_years.length, (int index) {
                      return Center(
                        child: Text(_years[index],
                            style:
                                GoogleFonts.nunito(textStyle: Helpers.style2)),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(90.0.h),
            child: Align(
              alignment: Alignment.bottomCenter,

              /// to have it working you need to wrap it with Material
              /// so use elevated button instead
              child: InkWell(
                onTap: () => navigationBloc.selectYearOfBirth(
                  notificationChoice:
                      (navigationBloc.state as DateScreenNavigationState)
                          .notificationChoice,
                  yearOfBirth: selectedYear,
                ),
                child: Container(
                  width: 189.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: Svg('assets/images/bg_button.svg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Next',
                          style: GoogleFonts.nunito(
                              textStyle: Helpers.styleButton),
                        ),
                        SizedBox(width: 32.w),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)),
                                color: Colors.white),
                            child: const Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
