import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/cardio/cardio_vascular_viewmodel.dart';

class ArrestsResultsView extends StatelessWidget {
  const ArrestsResultsView({Key? key}) : super(key: key);

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
            'Cardiac Arrest Prediction',
            textAlign: TextAlign.center,
            color: HcColors.blue,
            style: TextStyles.b_25,
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: vm.imageFile == null
                ? const Text('No image selected.')
                : Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 2),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Image.file(vm.imageFile!),
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
            // ignore: unnecessary_null_comparison
            vm.results != null ? vm.results!.category!.label : '',
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
            // ignore: unnecessary_null_comparison
            vm.results != null
                ? 'Confidence: ${vm.results?.category?.score.toStringAsFixed(3)}'
                : '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          // const Text(
          //   // ignore: unnecessary_null_comparison
          //   'Current Diabetes Reading: ',
          //   style: TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.w700,
          //     letterSpacing: 0.5,
          //     color: HcColors.purple,
          //   ),
          // ),
          // Text(
          //   // ignore: unnecessary_null_comparison
          //   '${vm.generateDiabetesReading()} mg/dl',
          //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          // ),
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
            // ignore: unnecessary_null_comparison
            'Complete Result Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'Mild Cardiac Arrest: ${vm.arrestResults?.mild?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'Moderate  Cardiac Arrest: ${vm.arrestResults?.moderate?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'No Cardiac Arrest: ${vm.arrestResults?.no?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'Proliferative Cardiac Arrest: ${vm.arrestResults?.proliferative?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'Severe Cardiac Arrest: ${vm.arrestResults?.severe?.toStringAsFixed(3)}',
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
