import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/cardio/blood_pressure/blood_pressure_results_view.dart';
import 'package:healthcare_360_mobile/ui/cardio/cardio_vascular_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/shared_widgets/center_tile.dart';

class CardioVascularHub extends StatelessWidget {
  const CardioVascularHub({Key? key}) : super(key: key);

  void _showPicker(context, CardioVascularViewModel model) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    model.getImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      model.getImageFromGallery();

                      Navigator.of(context).pop();
                    }),
              ],
            ),
          );
        });
  }

  void _showAttackPicker(context, CardioVascularViewModel model) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    model.getAttackImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      model.getAttackImageFromGallery();

                      Navigator.of(context).pop();
                    }),
              ],
            ),
          );
        });
  }

  void _showBPPicker(context, CardioVascularViewModel model) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    model.getBPImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      model.getAttackImageFromGallery();

                      Navigator.of(context).pop();
                      Future.delayed(const Duration(seconds: 3)).whenComplete(
                          () =>
                              Get.off(() => const BloodPressureResultsView()));
                    }),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CardioVascularViewModel>();
    return BaseViewWidget(
      avoidScrollView: false,
      body: Column(
        children: <Widget>[
          const Spacer(),
          const Spacer(),
          Image.asset(
            'assets/logo.png',
            height: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            'Welcome to\nCardio Vascular Hub',
            textAlign: TextAlign.center,
            color: HcColors.blue,
            style: TextStyles.b_20,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            'Detection & Prediction',
            textAlign: TextAlign.center,
            color: HcColors.grey,
            style: TextStyles.m_16,
          ),
          SizedBox(
            height: 20.h,
          ),
          const CustomText(
            'We use Computer Vision to predict, by looking at the image of Retina. Our intelligent A.I System classifies and categorize the results for you',
            textAlign: TextAlign.center,
            style: TextStyles.r_14,
          ),
          SizedBox(
            height: 5.h,
          ),
          vm.loading
              ? const SpinKitWanderingCubes(
                  color: HcColors.purple,
                  size: 50.0,
                )
              : LargeCenterTile(
                  title: 'Cardiac Arrest',
                  subTitle: 'Let\'s Predict',
                  iconPath: 'assets/1.svg',
                  iconHeight: 90,
                  color: HcColors.lightPink,
                  action: () {
                    _showPicker(
                        context, context.read<CardioVascularViewModel>());
                  },
                ),
          vm.loading2
              ? const SpinKitWanderingCubes(
                  color: HcColors.purple,
                  size: 50.0,
                )
              : LargeCenterTile(
                  title: 'Heart Attack',
                  subTitle: 'Let\'s Predict',
                  iconPath: 'assets/2.svg',
                  color: Colors.orange.shade100,
                  iconHeight: 80,
                  action: () {
                    _showAttackPicker(
                        context, context.read<CardioVascularViewModel>());
                  },
                ),
          vm.loading2
              ? const SpinKitWanderingCubes(
                  color: HcColors.purple,
                  size: 50.0,
                )
              : LargeCenterTile(
                  title: 'Blood Pressure',
                  subTitle: 'Let\'s Detect',
                  iconPath: 'assets/3.svg',
                  iconHeight: 80,
                  color: HcColors.lightBlue,
                  action: () {
                    _showBPPicker(
                        context, context.read<CardioVascularViewModel>());
                  },
                ),
          const SizedBox(
            height: 36,
          ),
        ],
      ),
    );
  }
}
