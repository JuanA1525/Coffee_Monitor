import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
  final double temp;
  final double hum;
  final double sun;
  final double air;
  final DateTime time;

  Data({
    required this.temp,
    required this.hum,
    required this.sun,
    required this.air,
    required this.time,
  });

  factory Data.fromMap(Map<String, dynamic> data) {
    return Data(
      temp: data['temp'] != null
          ? (data['temp'] is int
              ? (data['temp'] as int).toDouble()
              : data['temp'] as double)
          : 0.0, // Valor predeterminado en caso de que sea null
      hum: data['hum'] != null
          ? (data['hum'] is int
              ? (data['hum'] as int).toDouble()
              : data['hum'] as double)
          : 0.0, // Valor predeterminado en caso de que sea null
      sun: data['sun'] != null
          ? (data['sun'] is int
              ? (data['sun'] as int).toDouble()
              : data['sun'] as double)
          : 0.0, // Valor predeterminado en caso de que sea null
      air: data['air'] != null
          ? (data['air'] is int
              ? (data['air'] as int).toDouble()
              : data['air'] as double)
          : 0.0, // Valor predeterminado en caso de que sea null
      time: data['time'] != null
          ? (data['time'] as Timestamp).toDate()
          : DateTime.now(), // Valor predeterminado en caso de que sea null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'hum': hum,
      'sun': sun,
      'air': air,
      'time': Timestamp.fromDate(time),
    };
  }
}
