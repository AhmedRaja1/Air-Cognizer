import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/shared_widgets/menu_tile.dart';
import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_prediction_view.dart';
import 'package:healthcare_360_mobile/ui/views/menu/menu_viewmodel.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuViewModel>(builder: (context, vm, child) {
      return BaseViewWidget(
        avoidScrollView: false,
        body: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 200,
            ),
            SizedBox(
              height: 25.h,
            ),
            const CustomText(
              'Our Hubs',
              style: TextStyles.m_29,
              color: HcColors.purple,
            ),
            SizedBox(
              height: 25.h,
            ),
            Menu2Tile(
              title: 'Environment',
              subTitle: 'Air Quality Index',
              iconPath: 'assets/planet-earth.png',
              color: const Color(0xFFbaeb6c).withOpacity(0.3),
              isImage: true,
              action: () {
                Get.to(() => const AqiPredictionView());
              },
            ),
            // Menu2Tile(
            //   title: 'Coming SOon',
            //   subTitle: 'Coming Soon',
            //   iconPath: 'assets/ecg-reading.svg',
            //   iconHeight: 80,
            //   color: HcColors.lightBlue,
            //   action: () {
            //     // Get.to(() => const CardioVascularHub());
            //   },
            // ),
            SizedBox(
              height: 25.h,
            ),
          ],
        ),
      );
    });
  }
}
