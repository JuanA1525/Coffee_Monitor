import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_monitor/models/finca.dart';
import 'package:coffee_monitor/models/pergamino.dart';
import 'package:coffee_monitor/models/sector.dart';
import 'package:coffee_monitor/models/data.dart';
import 'package:coffee_monitor/services/sensor_data_service.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final SensorDataService _sensorDataService = SensorDataService();

  late Finca finca;
  final String fincaID;

  // Instancia privada de FirestoreService
  static final FirestoreService _instance = FirestoreService._internal();

  // Constructor privado que inicializa la instancia de FirestoreService
  // ignore: unused_element
  FirestoreService._internal({this.fincaID = "qJJsAlZptOHABvhHqBhl"}) {
    addRandomDataPeriodically();
  }

  // Función estática que proporciona acceso a la única instancia de FirestoreService
  static FirestoreService get instance => _instance;

  Future<Finca> getFincaById(String fincaId) async {
    DocumentSnapshot fincaDoc =
        await _db.collection('finca').doc(fincaId).get();
    if (!fincaDoc.exists) {
      throw Exception("Finca no encontrada");
    }

    List<Pergamino> pergaminoList = await getPergaminos(fincaId);
    return Finca.fromMap(
        fincaDoc.data() as Map<String, dynamic>, pergaminoList);
  }

  Future<List<Pergamino>> getPergaminos(String fincaId) async {
    QuerySnapshot pergaminoSnapshot = await _db
        .collection('finca')
        .doc(fincaId)
        .collection('pergaminos')
        .get();
    List<Pergamino> pergaminoList = [];

    for (var pergaminoDoc in pergaminoSnapshot.docs) {
      String pergaminoId = pergaminoDoc.id;
      List<Sector> sectorList = await getSectors(fincaId, pergaminoId);
      pergaminoList.add(Pergamino.fromMap(
          pergaminoDoc.data() as Map<String, dynamic>, sectorList));
    }

    return pergaminoList;
  }

  Future<List<Sector>> getSectors(String fincaId, String pergaminoId) async {
    QuerySnapshot sectorSnapshot = await _db
        .collection('finca')
        .doc(fincaId)
        .collection('pergaminos')
        .doc(pergaminoId)
        .collection('sectores')
        .get();
    List<Sector> sectorList = [];

    for (var sectorDoc in sectorSnapshot.docs) {
      String sectorId = sectorDoc.id;
      List<Data> dataList = await getData(fincaId, pergaminoId, sectorId);
      sectorList.add(
          Sector.fromMap(sectorDoc.data() as Map<String, dynamic>, dataList));
    }

    return sectorList;
  }

  Future<List<Data>> getData(
      String fincaId, String pergaminoId, String sectorId) async {
    QuerySnapshot dataSnapshot = await _db
        .collection('finca')
        .doc(fincaId)
        .collection('pergaminos')
        .doc(pergaminoId)
        .collection('sectores')
        .doc(sectorId)
        .collection('data')
        .get();
    List<Data> dataList = [];

    for (var dataDoc in dataSnapshot.docs) {
      dataList.add(Data.fromMap(dataDoc.data() as Map<String, dynamic>));
    }

    return dataList;
  }

  Future<void> printDatabase() async {
    try {
      // Obtener todas las fincas
      QuerySnapshot fincasSnapshot = await _db.collection('finca').get();
      for (var fincaDoc in fincasSnapshot.docs) {
        print('Finca: ${fincaDoc.id} - Nombre: ${fincaDoc['name']}');

        // Obtener todos los pergaminos de la finca
        QuerySnapshot pergaminosSnapshot =
            await fincaDoc.reference.collection('pergaminos').get();
        for (var pergaminoDoc in pergaminosSnapshot.docs) {
          print(
              '\tPergamino: ${pergaminoDoc.id} - Numero: ${pergaminoDoc['num']}');

          // Obtener todos los sectores del pergamino
          QuerySnapshot sectoresSnapshot =
              await pergaminoDoc.reference.collection('sectores').get();
          for (var sectorDoc in sectoresSnapshot.docs) {
            print('\t\tSector: ${sectorDoc.id} - Numero: ${sectorDoc['num']}');

            // Obtener todos los datos del sector
            QuerySnapshot dataSnapshot =
                await sectorDoc.reference.collection('data').get();
            for (var dataDoc in dataSnapshot.docs) {
              print(
                  '\t\t\tData: ${dataDoc.id} - Temp: ${dataDoc['temp']}, Hum: ${dataDoc['hum']}, Sun: ${dataDoc['sun']}, Air: ${dataDoc['air']}, Time: ${dataDoc['time']}');
            }
          }
        }
      }
    } catch (error) {
      print('Error al imprimir la base de datos: $error');
    }
  }

  Future<void> loadData() async {
    try {
      finca = await getFincaById(fincaID);
      // Imprimir información de la finca cargada
      print('Datos de finca cargados:');
      print('Nombre: ${finca.nombre}');
      print('Número de pergaminos: ${finca.pergaminoList.length}');
      for (var pergamino in finca.pergaminoList) {
        print('Pergamino ${pergamino.numero}:');
        print('Número de sectores: ${pergamino.sectorList.length}');
        for (var sector in pergamino.sectorList) {
          print('Sector ${sector.numero}:');
          print('Número de datos: ${sector.dataList.length}');
        }
      }
    } catch (error) {
      print('Error al cargar los datos: $error');
      // Si hay un error, asignar una instancia de Finca vacía o manejarlo según sea necesario
      finca = Finca(nombre: 'Finca no encontrada', pergaminoList: []);
    }
  }

  void addRandomDataPeriodically() {
    Timer.periodic(Duration(minutes: 5), (timer) async {
      try {
        // Iterar sobre cada pergamino y sector
        for (var pergamino in finca.pergaminoList) {
          for (var sector in pergamino.sectorList) {
            // Generar datos aleatorios
            Data newData = _sensorDataService.generateRandomData();

            // Agregar los nuevos datos al sector
            sector.dataList.add(newData);

            // Agregar los nuevos datos a la base de datos
            await _db
                .collection('finca')
                .doc(fincaID)
                .collection('pergaminos')
                .doc(pergamino.numero.toString())
                .collection('sectores')
                .doc(sector.numero.toString())
                .collection('data')
                .add(newData.toMap());
          }
        }
        print('Datos aleatorios agregados exitosamente.');
      } catch (error) {
        print('Error al agregar datos aleatorios: $error');
      }
    });
  }

  Future<Map<String, double>> calculateAveragesFinca() async {
    List<double> humValues = [];
    List<double> sunValues = [];
    List<double> tempValues = [];
    List<double> airValues = [];

    // Recorrer todos los pergaminos
    for (var pergamino in finca.pergaminoList) {
      // Recorrer todos los sectores
      for (var sector in pergamino.sectorList) {
        // Ordenar los datos por tiempo de manera descendente
        List<Data> sortedData = sector.dataList;
        sortedData.sort((a, b) => b.time.compareTo(a.time));

        // Tomar los 10 primeros registros (o menos si no hay tantos)
        int count = min(10, sortedData.length);
        for (int i = 0; i < count; i++) {
          var data = sortedData[i];
          humValues.add(data.hum);
          sunValues.add(data.sun);
          tempValues.add(data.temp);
          airValues.add(data.air);
        }
      }
    }

    // Calcular los promedios
    int count = humValues.length;
    double humAverage = count > 0
        ? double.parse(
            (humValues.reduce((a, b) => a + b) / count).toStringAsFixed(1))
        : 0.0;
    double sunAverage = count > 0
        ? double.parse(
            (sunValues.reduce((a, b) => a + b) / count).toStringAsFixed(1))
        : 0.0;
    double tempAverage = count > 0
        ? double.parse(
            (tempValues.reduce((a, b) => a + b) / count).toStringAsFixed(1))
        : 0.0;
    double airAverage = count > 0
        ? double.parse(
            (airValues.reduce((a, b) => a + b) / count).toStringAsFixed(1))
        : 0.0;

    print('Average Humidity: $humAverage');
    print('Average Sunlight: $sunAverage');
    print('Average Temperature: $tempAverage');
    print('Average Air: $airAverage');

    return {
      'humAverageFinca': humAverage,
      'sunAverageFinca': sunAverage,
      'tempAverageFinca': tempAverage,
      'airAverageFinca': airAverage,
    };
  }

  Future<Map<String, double>> calculateAveragesPergamino(
      Pergamino pergamino) async {
    List<double> humValues = [];
    List<double> sunValues = [];
    List<double> tempValues = [];
    List<double> airValues = [];

    // Recorrer todos los sectores del pergamino
    for (var sector in pergamino.sectorList) {
      // Ordenar los datos por tiempo de manera descendente
      List<Data> sortedData = sector.dataList;
      sortedData.sort((a, b) => b.time.compareTo(a.time));

      // Tomar los 10 primeros registros (o menos si no hay tantos)
      int count = min(10, sortedData.length);
      for (int i = 0; i < count; i++) {
        var data = sortedData[i];
        humValues.add(data.hum);
        sunValues.add(data.sun);
        tempValues.add(data.temp);
        airValues.add(data.air);
      }
    }

    // Calcular los promedios
    int count = humValues.length;
    double humAverage = count > 0
        ? double.parse(
            (humValues.reduce((a, b) => a + b) / count).toStringAsFixed(1))
        : 0.0;
    double sunAverage = count > 0
        ? double.parse(
            (sunValues.reduce((a, b) => a + b) / count).toStringAsFixed(1))
        : 0.0;
    double tempAverage = count > 0
        ? double.parse(
            (tempValues.reduce((a, b) => a + b) / count).toStringAsFixed(1))
        : 0.0;
    double airAverage = count > 0
        ? double.parse(
            (airValues.reduce((a, b) => a + b) / count).toStringAsFixed(1))
        : 0.0;

    print('Average Humidity for Pergamino #${pergamino.numero}: $humAverage');
    print('Average Sunlight for Pergamino #${pergamino.numero}: $sunAverage');
    print(
        'Average Temperature for Pergamino #${pergamino.numero}: $tempAverage');
    print('Average Air for Pergamino #${pergamino.numero}: $airAverage');

    return {
      'humAveragePergamino': humAverage,
      'sunAveragePergamino': sunAverage,
      'tempAveragePergamino': tempAverage,
      'airAveragePergamino': airAverage,
    };
  }

  Future<Map<String, double>> getMostRecentData(Sector sector) async {
    if (sector.dataList.isEmpty) {
      throw Exception("No data available in this sector.");
    }

    // Ordenar los datos por tiempo de manera descendente y tomar el más reciente
    Data mostRecentData = sector.dataList.reduce(
        (current, next) => current.time.isAfter(next.time) ? current : next);

    return {
      'hum': mostRecentData.hum,
      'sun': mostRecentData.sun,
      'temp': mostRecentData.temp,
      'air': mostRecentData.air,
    };
  }
}
