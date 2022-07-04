import 'package:flutter/material.dart';
import 'package:to_do_app/src/constants/colors.dart';
import 'package:to_do_app/src/constants/text_styles.dart';

class AppButton extends StatelessWidget {
  final String label;
  final onTap;

  const AppButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.cyanBlueColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: AppTextStyle.buttonStyle,
        ),
      ),
    );
  }
}
