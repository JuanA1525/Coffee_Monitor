import 'package:coffee_monitor/services/model_service.dart';
import 'package:flutter/material.dart';

class TestModelScreen extends StatelessWidget {
  final TFLiteService tfliteService = TFLiteService.instance;

  TestModelScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TensorFlow Lite Demo'),
        ),
        body: Center(
          child: ModelPredictionWidget(),
        ),
      ),
    );
  }
}

class ModelPredictionWidget extends StatelessWidget {
  final TFLiteService tfliteService = TFLiteService.instance;

  ModelPredictionWidget();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var output = await tfliteService.runModel();
        print('Output: $output');
      },
      child: Text('Ejecutar Modelo'),
    );
  }
}
