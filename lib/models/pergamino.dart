import 'package:coffee_monitor/models/sector.dart';

class Pergamino {
  final int numero;
  final List<Sector> sectorList;

  Pergamino({required this.numero, required this.sectorList});

  factory Pergamino.fromMap(
      Map<String, dynamic> data, List<Sector> sectorList) {
    return Pergamino(
      numero:
          data['num'] ?? 0, // Proporcionar un valor predeterminado si es null
      sectorList: sectorList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'num': numero,
      // sectorList should be converted separately
    };
  }
}
