import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart' as notify;
import 'package:healthcare_360_mobile/core/models/arrest_model.dart';
import 'package:healthcare_360_mobile/core/models/attack_model.dart';
import 'package:healthcare_360_mobile/core/models/tflite_return_model.dart';
import 'package:healthcare_360_mobile/ui/cardio/arrest_classifier.dart';
import 'package:healthcare_360_mobile/ui/cardio/arrest_float.dart';
import 'package:healthcare_360_mobile/ui/cardio/arrest_results_view.dart';
import 'package:healthcare_360_mobile/ui/cardio/attack_classifier.dart';
import 'package:healthcare_360_mobile/ui/cardio/attack_float.dart';
import 'package:healthcare_360_mobile/ui/cardio/attack_results_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:get/get.dart';

import 'blood_pressure/blood_pressure_results_view.dart';

class CardioVascularViewModel with notify.ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  bool _loading2 = false;
  bool get loading2 => _loading2;

  bool _loading3 = false;
  bool get loading3 => _loading3;

  setState(bool state) {
    _loading = state;
    notifyListeners();
  }

  setState2(bool state) {
    _loading2 = state;
    notifyListeners();
  }

  setState3(bool state) {
    _loading3 = state;
    notifyListeners();
  }

  // ignore: prefer_final_fields
  ArrestClassifier _classifier = CardiacArrestFloatClassifier();
  ArrestClassifier get classifier => _classifier;

  // ignore: prefer_final_fields
  AttackClassifier _attackClassifier = HeartAttackClassifierFloat();
  AttackClassifier get attackClassifier => _attackClassifier;

  Category? _category;
  Category? get category => _category;

  ArrestModel? _arrestResults;
  ArrestModel? get arrestResults => _arrestResults;

  AttackModel? _attackModel;
  AttackModel? get attackModel => _attackModel;

  TfLiteReturnModel? _results;
  TfLiteReturnModel? get results => _results;

  TfLiteReturnModel? _tfAttackResults;
  TfLiteReturnModel? get tfAttackresults => _tfAttackResults;

  File? _imageFile;
  File? get imageFile => _imageFile;

  File? _attackImage;
  File? get attackImage => _attackImage;

  int generateSystolicBPReading() {
    Random random = Random();
    int randomNumber = random.nextInt(131 - 100) + 100;
    return randomNumber;
    // print(randomNumber);
  }

  int generateDiastolicBPReading() {
    Random random = Random();
    int randomNumber = random.nextInt(85 - 60) + 60;
    return randomNumber;
    // print(randomNumber);
  }

  Future<void> getImageFromGallery() async {
    _imageFile = null;
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    _imageFile = File(pickedFile!.path);
    notifyListeners();
    // Get.to(() => const DiabetesResultsView(),
    //     transition: Transition.noTransition);

    _predictArrest();
  }

  _reshapeResults() {
    // final body = jsonDecode(_results.results);

    _arrestResults = ArrestModel.fromJson(json: _results!.results);
  }

  Future<void> getAttackImageFromGallery() async {
    _attackImage = null;
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    _attackImage = File(pickedFile!.path);
    notifyListeners();
    // Get.to(() => const DiabetesResultsView(),
    //     transition: Transition.noTransition);

    _predictAttack();
  }

  Future<void> getBPImageFromGallery() async {
    _attackImage = null;
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    _attackImage = File(pickedFile!.path);
    notifyListeners();
    Future.delayed(const Duration(seconds: 3))
        .whenComplete(() => Get.off(() => const BloodPressureResultsView()));
  }

  Future<void> getBPImageFromCamera() async {
    _attackImage = null;
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    _attackImage = File(pickedFile!.path);
    notifyListeners();
    Future.delayed(const Duration(seconds: 3))
        .whenComplete(() => Get.off(() => const BloodPressureResultsView()));

    // Get.to(() => const DiabetesResultsView(),
    //     transition: Transition.noTransition);

    // _predictAttack();
  }

  _reshapeAttackResults() {
    // final body = jsonDecode(_results.results);
    _attackModel = AttackModel.fromJson(json: _tfAttackResults!.results);
  }

  Future<void> getImageFromCamera() async {
    _imageFile = null;

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    _imageFile = File(pickedFile!.path);
    notifyListeners();
    _predictArrest();
  }

  Future<void> getAttackImageFromCamera() async {
    _attackImage = null;

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    _attackImage = File(pickedFile!.path);
    notifyListeners();
    _predictAttack();
  }

  void _predictArrest() async {
    setState(true);
    img.Image imageInput = img.decodeImage(_imageFile!.readAsBytesSync())!;
    // var pred = _classifier.predict(imageInput);
    TfLiteReturnModel pred = _classifier.predictDiabetes(imageInput);

    _results = pred;
    _reshapeResults();

    setState(false);
    Get.to(() => const ArrestsResultsView(),
        transition: Transition.noTransition);
  }

  void _predictAttack() async {
    setState2(true);

    img.Image imageInput = img.decodeImage(_attackImage!.readAsBytesSync())!;
    // var pred = _classifier.predict(imageInput);
    TfLiteReturnModel pred = _attackClassifier.predictDiabetes(imageInput);

    _tfAttackResults = pred;
    _reshapeAttackResults();

    setState2(false);
    Get.to(() => const AttackResultsView(),
        transition: Transition.noTransition);
  }
  //  void _predictAttack() async {
  //   setState2(true);
  //   print('Inside Attack');

  //   img.Image imageInput = img.decodeImage(_attackImage!.readAsBytesSync())!;
  //   // var pred = _classifier.predict(imageInput);
  //   TfLiteReturnModel pred = _attackClassifier.predictDiabetes(imageInput);

  //   _tfAttackResults = pred;
  //   _reshapeAttackResults();

  //   setState2(false);
  //   Get.to(() => const AttackResultsView(),
  //       transition: Transition.noTransition);
  // }
}
