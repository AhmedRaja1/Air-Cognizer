import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/core/models/our_services_model.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';

class MenuTile extends StatelessWidget {
  final OurServicesModel service;
  const MenuTile({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 15,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ], color: HcColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(service.iconPath),
          SizedBox(
            height: 15.h,
          ),
          Text(
            service.title,
            textAlign: TextAlign.center,
            style: TextStyles.r_15.copyWith(
              color: HcColors.blue,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
