import 'dart:math';
import 'package:coffee_monitor/models/data.dart';
import 'package:coffee_monitor/models/pergamino.dart';
import 'package:flutter/material.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

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
    double sun = _generateRandomValue(4, 7);
    DateTime time = DateTime.now(); // Puedes cambiar esto según sea necesario

    return Data(temp: temp, hum: hum, sun: sun, air: air, time: time);
  }

  Widget generateGraphForPergamino(Pergamino pergamino, String characteristic) {
    // Colors for each sector
    final colors = [
      charts.MaterialPalette.red.shadeDefault,
      charts.MaterialPalette.blue.shadeDefault,
      charts.MaterialPalette.green.shadeDefault,
    ];

    String charTitle = '';

    switch (characteristic) {
      case 'hum':
        {
          charTitle = "Humedad (%)";
          break;
        }
      case 'temp':
        {
          charTitle = "Temperatura (°C)";
          break;
        }
      case 'air':
        {
          charTitle = "Viento (m/s)";
          break;
        }
      case 'sun':
        {
          charTitle = "Tiempo Solar (h)";
          break;
        }
      default:
        charTitle = "Caracteristica";
    }

    // Data series
    List<charts.Series<Data, DateTime>> seriesList = [];

    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day);

    for (int i = 0; i < pergamino.sectorList.length; i++) {
      var sector = pergamino.sectorList[i];
      List<Data> sortedData = sector.dataList
          .where((data) => data.time.isAfter(startOfDay))
          .toList();
      sortedData.sort((a, b) => a.time.compareTo(b.time));

      var data = sortedData.take(20).toList();

      seriesList.add(
        charts.Series<Data, DateTime>(
          id: 'Sector ${sector.numero}',
          colorFn: (_, __) => colors[i % colors.length],
          domainFn: (Data data, _) => data.time,
          measureFn: (Data data, _) {
            switch (characteristic) {
              case 'hum':
                {
                  return data.hum;
                }
              case 'temp':
                {
                  return data.temp;
                }
              case 'air':
                {
                  return data.air;
                }
              case 'sun':
                {
                  return data.sun;
                }
              default:
                return 0.0;
            }
          },
          data: data,
        ),
      );
    }

    return charts.TimeSeriesChart(
      seriesList,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      behaviors: [
        charts.SeriesLegend(
          position: charts.BehaviorPosition.bottom,
          outsideJustification: charts.OutsideJustification.middleDrawArea,
        ),
        charts.ChartTitle(
          'Tiempo',
          behaviorPosition: charts.BehaviorPosition.bottom,
          titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
          titleStyleSpec: charts.TextStyleSpec(
            fontSize: 18,
            color: charts.Color(r: 0x36, g: 0x40, b: 0x27),
            fontWeight: 'bold',
          ),
        ),
        charts.ChartTitle(charTitle,
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea,
            titleStyleSpec: charts.TextStyleSpec(
              fontSize: 18,
              color: charts.Color(r: 0x36, g: 0x40, b: 0x27),
              fontWeight: 'bold',
            ) // Add this line
            ),
      ],
      defaultRenderer: charts.LineRendererConfig<DateTime>(
        includePoints: true,
        includeArea: true,
        stacked: false,
        radiusPx: 4.0,
        strokeWidthPx: 2.0,
      ),
    );
  }
}
