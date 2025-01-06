import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/cardio/cardio_vascular_viewmodel.dart';

class AttackResultsView extends StatelessWidget {
  const AttackResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CardioVascularViewModel>();
    return BaseViewWidget(
      avoidScrollView: false,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30.h,
          ),
          const CustomText(
            'Heart Attack Prediction',
            textAlign: TextAlign.center,
            color: HcColors.blue,
            style: TextStyles.b_25,
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: vm.attackImage == null
                ? const Text('No image selected.')
                : Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 2),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Image.file(vm.attackImage!),
                  ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomText(
            'Max Chances',
            textAlign: TextAlign.center,
            style: TextStyles.m_18,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            vm.tfAttackresults != null
                ? vm.tfAttackresults!.category!.label
                : '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: HcColors.purple,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            vm.results != null
                ? 'Confidence: ${vm.tfAttackresults?.category?.score.toStringAsFixed(3)}'
                : '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 5.h,
            color: Colors.grey.withOpacity(0.1),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Complete Result Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Mild Heart Attack: ${vm.attackModel?.mild?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            'Moderate Heart Attack: ${vm.attackModel?.moderate?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            'No Heart Attack: ${vm.attackModel?.no?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            'Proliferative Heart Attack: ${vm.attackModel?.proliferative?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            'Severe Heart Attack: ${vm.attackModel?.severe?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
