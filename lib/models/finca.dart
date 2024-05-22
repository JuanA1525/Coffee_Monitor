import 'package:coffee_monitor/models/pergamino.dart';

class Finca {
  final String nombre;
  final List<Pergamino> pergaminoList;

  Finca({
    required this.nombre,
    required this.pergaminoList,
  });

  factory Finca.fromMap(
      Map<String, dynamic> data, List<Pergamino> pergaminoList) {
    return Finca(
      nombre: data['name'] ??
          'Nombre desconocido', // Valor predeterminado si es null
      pergaminoList: pergaminoList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': nombre,
    };
  }
}
