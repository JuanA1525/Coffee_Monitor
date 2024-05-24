import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';

class TFLiteService {
  Interpreter? _interpreter;

  TFLiteService._privateConstructor();
  final Map<String, double> input = {
    'humedad_grano': 45.0,
    'peso_lote': 75.0,
    'temperatura_ambiente': 20.0,
    'tiempo_solar': 5.0,
    'latitud': 6.15,
    'longitud': -75.5,
    'velocidad_viento': 6.0,
    'humedad_relativa': 70.0,
  };
  static final TFLiteService _instance = TFLiteService._privateConstructor();

  static TFLiteService get instance {
    return _instance;
  }

  Future<void> loadModel() async {
    try {
      this._interpreter = await Interpreter.fromAsset('assets/model.tflite');
      print('Model loaded successfully');
    } catch (e) {
      print('Failed to load model.');
      print(e);
    }
  }

  Future<List?> runModel() async {
    var inputList = input.values.toList();
    print('Input: $inputList');
    var inputBuffer = inputToByteBuffer(inputList);
    print('Input buffer: $inputBuffer');
    var output = List<double>.filled(1, 0).reshape([1, 1]);
    _interpreter?.run(inputBuffer, output);
    print('Output: $output');
    return output;
  }

  ByteBuffer inputToByteBuffer(List<double> inputList) {
    var float32List = Float32List.fromList(inputList);
    return float32List.buffer;
  }
}
