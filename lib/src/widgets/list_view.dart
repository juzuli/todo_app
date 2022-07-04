import 'package:flutter/material.dart';
import 'package:to_do_app/src/constants/colors.dart';
import 'package:to_do_app/src/constants/text_styles.dart';

class AppListTile extends StatelessWidget {
  String label;
  final value;
  final onTap;
  final borderRadius;

  AppListTile(
      {Key? key,
      required this.label,
      required this.value,
      required this.onTap,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: ListTile(
        tileColor: AppColors.solitudeBlueColor,
        onTap: onTap,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTextStyle.formLabelStyle,
            ),
            Text(
              value,
              style: AppTextStyle.formValueStyle,
            ),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.delftBlueColor,
          size: 15,
        ),
      ),
    );
  }
}
