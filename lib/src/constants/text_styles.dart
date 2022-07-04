import 'package:flutter/material.dart';
import 'package:to_do_app/src/constants/colors.dart';

class AppTextStyle {
  static const TextStyle headingStyle = TextStyle(
    color: AppColors.appBlackColor,
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );
  static const TextStyle subHeadingStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
  static const TextStyle buttonStyle = TextStyle(
    color: AppColors.appWhiteColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const TextStyle formSubHeadingStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.appTitleColor,
    fontSize: 13,
  );
  static const TextStyle formLabelStyle = TextStyle(
    color: AppColors.appBlackColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static const TextStyle formValueStyle = TextStyle(
    color: AppColors.cyanBlueColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static const TextStyle sheetHeadingStyle = TextStyle(
    color: AppColors.cobaltBlueColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const TextStyle timelineSubStyle = TextStyle(
    color: AppColors.appTitleColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const TextStyle timelineTitleStyle = TextStyle(
    color: AppColors.appSubTitleColor,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
}
