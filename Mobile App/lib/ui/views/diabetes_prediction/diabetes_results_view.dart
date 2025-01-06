import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_viewmodel.dart';

class DiabetesResultsView extends StatelessWidget {
  const DiabetesResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AqiViewModel>();
    return BaseViewWidget(
      avoidScrollView: false,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30.h,
          ),
          const CustomText(
            'Diabetes Detection Center',
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
          // const Text(
          //   // ignore: unnecessary_null_comparison
          //   'Complete Result Card',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   // ignore: unnecessary_null_comparison
          //   'Mild Diabetes: ${vm.diabetesResults?.mild?.toStringAsFixed(3)}',
          //   style: const TextStyle(fontSize: 14),
          // ),
          // Text(
          //   // ignore: unnecessary_null_comparison
          //   'Moderate  Diabetes: ${vm.diabetesResults?.moderate?.toStringAsFixed(3)}',
          //   style: const TextStyle(fontSize: 14),
          // ),
          // Text(
          //   // ignore: unnecessary_null_comparison
          //   'No Diabetes: ${vm.diabetesResults?.no?.toStringAsFixed(3)}',
          //   style: const TextStyle(fontSize: 14),
          // ),
          // Text(
          //   // ignore: unnecessary_null_comparison
          //   'Proliferative Diabetes: ${vm.diabetesResults?.proliferative?.toStringAsFixed(3)}',
          //   style: const TextStyle(fontSize: 14),
          // ),
          // Text(
          //   // ignore: unnecessary_null_comparison
          //   'Severe Diabetes: ${vm.diabetesResults?.severe?.toStringAsFixed(3)}',
          //   style: const TextStyle(fontSize: 14),
          // ),
          // SizedBox(
          //   height: 30.h,
          // ),
        ],
      ),
    );
  }
}
