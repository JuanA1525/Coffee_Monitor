import 'dart:math';
import 'package:coffee_monitor/models/data.dart';

class SensorDataService {
  // Instancia única del servicio
  static final SensorDataService _instance = SensorDataService._internal();

  // Constructor privado para evitar que se creen instancias directamente
  SensorDataService._internal();

  // Método estático para obtener la instancia única del servicio
  factory SensorDataService() {
    return _instance;
  }

  final Random _random = Random();

  // Función para generar un valor aleatorio dentro de un rango
  double _generateRandomValue(double min, double max) {
    double randomNumber = min + _random.nextDouble() * (max - min);
    return (randomNumber * 100).round() / 100; // Redondear a 2 decimales
  }

  // Función para generar datos aleatorios de sensores
  Data generateRandomData() {
    double hum = _generateRandomValue(63, 84);
    double air = _generateRandomValue(0, 12);
    double temp = _generateRandomValue(15, 31);
    // La exposición solar se actualiza diariamente, por lo que no es aleatoria aquí
    double sun = _generateRandomValue(
        4, 7); // Considera cómo obtener el valor real del sol
    DateTime time = DateTime.now(); // Puedes cambiar esto según sea necesario

    return Data(temp: temp, hum: hum, sun: sun, air: air, time: time);
  }
}
