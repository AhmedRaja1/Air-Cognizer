import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart' as notify;
import 'package:healthcare_360_mobile/core/models/diabetes_model.dart';
import 'package:healthcare_360_mobile/core/models/tflite_return_model.dart';
import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_classifier_float.dart';
import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_results_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:get/get.dart';
import 'diabetes_classifer.dart';

class AqiViewModel with notify.ChangeNotifier {
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
  DiabetesClassifier _classifier = DiabetesClassifierFloat();
  DiabetesClassifier get classifier => _classifier;

  Category? _category;
  Category? get category => _category;

  DiabetesModel? _diabetesResults;
  DiabetesModel? get diabetesResults => _diabetesResults;

  TfLiteReturnModel? _results;
  TfLiteReturnModel? get results => _results;

  File? _imageFile;
  File? get imageFile => _imageFile;

  int generateDiabetesReading() {
    Random random = Random();
    int randomNumber = random.nextInt(135 - 79) + 79;
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

    _predict();
  }

  _reshapeResults() {
    // final body = jsonDecode(_results.results);

    _diabetesResults = DiabetesModel.fromJson(json: _results!.results);
  }

  Future<void> getImageFromCamera() async {
    _imageFile = null;

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    _imageFile = File(pickedFile!.path);
    notifyListeners();

    // Get.to(() => const DiabetesResultsView(),
    //     transition: Transition.noTransition);

    _predict();
  }

  void _predict() async {
    setState(true);
    img.Image imageInput = img.decodeImage(_imageFile!.readAsBytesSync())!;
    // var pred = _classifier.predict(imageInput);
    TfLiteReturnModel pred = _classifier.predictDiabetes(imageInput);

    _results = pred;
    _reshapeResults();

    setState(false);
    Get.to(() => const DiabetesResultsView(),
        transition: Transition.noTransition);
  }
}
