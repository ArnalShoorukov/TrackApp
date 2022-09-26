import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/nav/nav_bloc.dart';
import '../helpers.dart';

class ChoiceScreen extends StatefulWidget {
  static const String id = '/choice_screen';

  const ChoiceScreen({Key? key}) : super(key: key);

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    void onTap(NotificationChoice buttonValue) => context
        .read<ScreenNavigationBloc>()
        .selectNotificationType(buttonValue);

    return Scaffold(
        body: Stack(
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
              _choiceSelectionButton(
                buttonValue: NotificationChoice.trackPeriod,
                description: 'contraception and wellbeing',
                onTap: onTap,
              ),
              SizedBox(height: 70.h),
              _choiceSelectionButton(
                buttonValue: NotificationChoice.getPregnant,
                description: 'learn about reproductive health',
                onTap: onTap,
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget _choiceSelectionButton({
    required NotificationChoice buttonValue,
    required String description,
    void Function(NotificationChoice)? onTap,
  }) =>
      InkWell(
        onTap: () => onTap?.call(buttonValue),
        child: Container(
          height: 130.h,
          width: 340.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              color: const Color(0xFFFFEFEF)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    buttonValue.title,
                    style: GoogleFonts.nunito(
                      textStyle: Helpers.style2,
                    ),
                  ),
                  Text(
                    description,
                    style: GoogleFonts.nunito(
                      textStyle: Helpers.styleChoice2,
                    ),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                    color: const Color(0xFF53538A)),
                child: const Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
}
