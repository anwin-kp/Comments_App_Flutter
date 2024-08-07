import 'package:firebase_complete_demo_app/shared/widgets/common%20widgets/common_text_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText(
      {super.key,
      required this.title1,
      required this.title2,
      required this.title3,
      this.color2,
      required this.title4});
  final Color? color2;
  final String title1, title2, title3, title4;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.kWhite)
            .copyWith(
                color: AppColors.kGrey600,
                fontWeight: FontWeight.w500,
                fontSize: 14),
        children: [
          TextSpan(
            text: title1,
          ),
          TextSpan(
            text: title2,
            style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kWhite)
                .copyWith(
                    color: color2 ?? AppColors.kLiteBlueColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
          ),
          TextSpan(
            text: title3,
            style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kWhite)
                .copyWith(
                    color: AppColors.kGrey600,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
          ),
          TextSpan(
            text: title4,
            style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kWhite)
                .copyWith(
                    color: AppColors.kLiteBlueColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.fontSize});
  final Function() onPressed;
  final String title;
  final int fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: TextMedium(
        text: title,
        fontSize: fontSize.sp,
        isUnderLine: false,
        textColor: AppColors.kLiteBlueColor,
        wantOverFlowEllipsis: false,
      ),
    );
  }
}
