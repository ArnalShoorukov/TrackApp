import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Helpers {
  static final style = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static final style2 = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w900,
    color: Colors.black,
  );
  static final styleButton = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static final styleChoice2 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}

enum NotificationChoice {
  getPregnant,
  trackPeriod,
}

extension TitleSelector on NotificationChoice {
  String get title {
    switch (this) {
      case NotificationChoice.getPregnant:
        return 'Get pregnant';
      case NotificationChoice.trackPeriod:
        return 'Track my period';
    }
  }
}
