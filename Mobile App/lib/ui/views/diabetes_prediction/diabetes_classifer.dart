import 'dart:developer' as dev;

import 'package:healthcare_360_mobile/core/models/tflite_return_model.dart';
import 'package:image/image.dart';
import 'package:collection/collection.dart';
// import 'package:logger/logger.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

abstract class DiabetesClassifier {
  late Interpreter interpreter;
  late InterpreterOptions _interpreterOptions;

  // var logger = Logger();

  late List<int> _inputShape;
  late List<int> _outputShape;

  late TensorImage _inputImage;
  late TensorBuffer _outputBuffer;

  late TfLiteType _inputType;
  late TfLiteType _outputType;
// TODO: changing to aqi labels
  final String _diabetesLabelsFileName = 'assets/labels.txt';
  // final String _diabetesLabelsFileName = 'assets/animals_labels.txt';
// TODO: changing to aqi label length

  final int _diabetesModellabelsLength = 22;

  // ignore: prefer_typing_uninitialized_variables
  late var _probabilityProcessor;

  late List<String> labels;

  String get modelName;

  NormalizeOp get preProcessNormalizeOp;
  NormalizeOp get postProcessNormalizeOp;

  DiabetesClassifier({int? numThreads}) {
    _interpreterOptions = InterpreterOptions();

    if (numThreads != null) {
      _interpreterOptions.threads = numThreads;
    }

    loadModel();
    loadLabels();
  }

  Future<void> loadModel() async {
    try {
      interpreter =
          await Interpreter.fromAsset(modelName, options: _interpreterOptions);
      dev.log('Interpreter Created Successfully');

      _inputShape = interpreter.getInputTensor(0).shape;
      _outputShape = interpreter.getOutputTensor(0).shape;
      _inputType = interpreter.getInputTensor(0).type;
      _outputType = interpreter.getOutputTensor(0).type;

      _outputBuffer = TensorBuffer.createFixedSize(_outputShape, _outputType);
      _probabilityProcessor =
          TensorProcessorBuilder().add(postProcessNormalizeOp).build();
    } catch (e) {
      dev.log(
          'Unable to create interpreter, Caught Exception: ${e.toString()}');
    }
  }

  Future<void> loadLabels() async {
    labels = await FileUtil.loadLabels(_diabetesLabelsFileName);
    if (labels.length == _diabetesModellabelsLength) {
      dev.log('Labels loaded successfully');
    } else {
      dev.log('Unable to load labels');
    }
  }

  TensorImage _preProcess() {
    // int cropSize = min(_inputImage.height, _inputImage.width);
    int cropSize = 224;

    return ImageProcessorBuilder()
        .add(ResizeWithCropOrPadOp(cropSize, cropSize))
        .add(ResizeOp(
            _inputShape[1], _inputShape[2], ResizeMethod.NEAREST_NEIGHBOUR))
        .add(preProcessNormalizeOp)
        .build()
        .process(_inputImage);
  }

  Category predict(Image image) {
    final pres = DateTime.now().millisecondsSinceEpoch;
    _inputImage = TensorImage(_inputType);
    _inputImage.loadImage(image);
    _inputImage = _preProcess();
    final pre = DateTime.now().millisecondsSinceEpoch - pres;

    dev.log('Time to load image: $pre ms');

    final runs = DateTime.now().millisecondsSinceEpoch;
    interpreter.run(_inputImage.buffer, _outputBuffer.getBuffer());
    final run = DateTime.now().millisecondsSinceEpoch - runs;

    dev.log('Time to run inference: $run ms');

    Map<String, double> labeledProb = TensorLabel.fromList(
            labels, _probabilityProcessor.process(_outputBuffer))
        .getMapWithFloatValue();
    dev.log(labeledProb.toString());
    final pred = getTopProbability(labeledProb);

    return Category(pred.key, pred.value);
  }

  TfLiteReturnModel predictDiabetes(Image image) {
    TfLiteReturnModel retVal = TfLiteReturnModel();
    final pres = DateTime.now().millisecondsSinceEpoch;
    _inputImage = TensorImage(_inputType);
    _inputImage.loadImage(image);
    _inputImage = _preProcess();
    final pre = DateTime.now().millisecondsSinceEpoch - pres;

    dev.log('Time to load image: $pre ms');

    final runs = DateTime.now().millisecondsSinceEpoch;
    interpreter.run(_inputImage.buffer, _outputBuffer.getBuffer());
    final run = DateTime.now().millisecondsSinceEpoch - runs;

    dev.log('Time to run inference: $run ms');

    Map<String, double> labeledProb = TensorLabel.fromList(
            labels, _probabilityProcessor.process(_outputBuffer))
        .getMapWithFloatValue();
    dev.log(labeledProb.toString());
    retVal.results = labeledProb;
    final pred = getTopProbability(labeledProb);
    retVal.category = Category(pred.key, pred.value);
    return retVal;
  }

  void close() {
    interpreter.close();
  }
}

MapEntry<String, double> getTopProbability(Map<String, double> labeledProb) {
  var pq = PriorityQueue<MapEntry<String, double>>(compare);
  pq.addAll(labeledProb.entries);

  return pq.first;
}

int compare(MapEntry<String, double> e1, MapEntry<String, double> e2) {
  if (e1.value > e2.value) {
    return -1;
  } else if (e1.value == e2.value) {
    return 0;
  } else {
    return 1;
  }
}
