import 'package:coffee_monitor/models/data.dart';

class Sector {
  final int numero;
  final List<Data> dataList;

  Sector({required this.numero, required this.dataList});

  factory Sector.fromMap(Map<String, dynamic> data, List<Data> dataList) {
    return Sector(
      numero:
          data['num'] ?? 0, // Proporcionar un valor predeterminado si es null
      dataList: dataList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'num': numero,
      // dataList should be converted separately
    };
  }
}
