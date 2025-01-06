import 'package:flutter/material.dart';

import '../base_view/base_view.dart';

class Menu2Tile extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback? action;
  final String iconPath;
  final bool? isImage;
  final double? iconHeight;
  final Color? color;
  const Menu2Tile(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.action,
      required this.iconPath,
      this.color,
      this.iconHeight,
      this.isImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
          // height: 200,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: color ?? const Color(0xFFFCD4D1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    'HUB',
                    style: TextStyles.m_15,
                    color: Colors.grey.shade600,
                  ),
                  CustomText(
                    title,
                    style: TextStyles.b_20,
                  ),
                  CustomText(
                    subTitle,
                    style: TextStyles.r_14,
                    color: Colors.grey.shade700,
                  ),
                ],
              ),
              isImage == true
                  ? Image.asset(
                      iconPath,
                      height: iconHeight ?? 100,
                    )
                  : SvgPicture.asset(
                      iconPath,
                      height: iconHeight ?? 100,
                    ),
            ],
          )),
    );
  }
}
