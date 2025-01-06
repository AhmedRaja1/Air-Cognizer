import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/core/others/colors.dart';
import 'package:healthcare_360_mobile/core/others/text_styles.dart';

class CustomText extends StatelessWidget {
  final TextStyle? style;
  final EdgeInsets? margins;
  final Color? color;
  final TextAlign? textAlign;
  final String? text;
  const CustomText(this.text,
      {Key? key, this.color, this.style, this.margins, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margins ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Text(
        text ?? '',
        textAlign: textAlign ?? TextAlign.left,
        style: TextStyles.retTextStyle(
            style ?? TextStyles.r_18, color ?? HcColors.black),
      ),
    );
  }
}
