import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'font_weight_helper.dart';

class TextStyles {

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainBlue,
  );
  static TextStyle font18WhiteBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
  );

  static TextStyle font16DarkBlueMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkerGrey,
  );

  static TextStyle font14LightGreyMedium  = TextStyle(
    color: ColorsManager.lightGrey,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
}