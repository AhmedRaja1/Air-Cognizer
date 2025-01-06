import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class TfLiteReturnModel {
  Map<String, double>? results;
  Category? category;

  TfLiteReturnModel({this.category, this.results});
}
