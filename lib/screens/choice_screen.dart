import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_app/screens/date_birth_screen.dart';

import '../blocs/nav/nav_bloc.dart';
import '../helpers.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({Key? key}) : super(key: key);

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NavBloc, NavState>(
          listener: (context, state) {
            if (state is ButtonClickedState) {
              debugPrint(state.props.toString());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  DateOfBirth(screenInfo: state.screenInfo,)));
            }
          },
          child: Stack(
            children: [
              Image(
                image: Svg('assets/images/top.svg', size: Size(220.w, 180.h)),
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image(
                  image: Svg('assets/images/bottom.svg',
                      size: Size(
                        70.w,
                        180.h,
                      )),
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 136.h,
                  left: 70.w,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    height: 136.h,
                    width: 138.w,
                    child: Stack(
                      children: [
                        Image(
                          image: Svg('assets/images/midOut.svg',
                              size: Size(138.w, 136.h)),
                          fit: BoxFit.contain,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Image(
                            image: Svg('assets/images/midIn.svg',
                                size: Size(64.w, 64.h)),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      child: Container(
                        height: 130.h,
                        width: 340.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                            color: const Color(0xFFFFEFEF)),
                        child: Padding(
                          padding: EdgeInsets.all(12.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Track my period',
                                      style: GoogleFonts.nunito(
                                          textStyle: Helpers.style2)),
                                  Text('contraception and wellbeing',
                                      style: GoogleFonts.nunito(
                                          textStyle: Helpers.styleChoice2))
                                ],
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.r)),
                                      color: const Color(0xFF53538A)),
                                  child: const Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      onTap: () => BlocProvider.of<NavBloc>(context)
                          .add(const ButtonClickedEvent('Track Date')),
                    ),
                    SizedBox(height: 70.h),
                    InkWell(
                      child: Container(
                        height: 130.h,
                        width: 340.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                            color: const Color(0xFFFFEFEF)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Get pregnant',
                                    style: GoogleFonts.nunito(
                                        textStyle: Helpers.style2)),
                                Text('learn about reproductive health',
                                    style: GoogleFonts.nunito(
                                        textStyle: Helpers.styleChoice2))
                              ],
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.r)),
                                    color: const Color(0xFF53538A)),
                                child: const Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                      onTap: () => BlocProvider.of<NavBloc>(context)
                          .add(const ButtonClickedEvent('Get Pregnant')),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
