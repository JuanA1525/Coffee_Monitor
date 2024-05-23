import 'package:flutter/material.dart';
import 'package:coffee_monitor/models/finca.dart';
import 'package:coffee_monitor/models/pergamino.dart';
import 'package:coffee_monitor/services/firebase_service.dart';

class TestDatabaseScreen extends StatelessWidget {
  final String fincaId;
  final FirestoreService _firestoreService = FirestoreService.instance;

  TestDatabaseScreen({required this.fincaId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Finca'),
      ),
      body: FutureBuilder<Finca>(
        future: _firestoreService.getFincaById(fincaId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Finca no encontrada'));
          }

          Finca finca = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre: ${finca.nombre}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Pergaminos:'),
                Expanded(
                  child: ListView.builder(
                    itemCount: finca.pergaminoList.length,
                    itemBuilder: (context, index) {
                      Pergamino pergamino = finca.pergaminoList[index];
                      return ListTile(
                        title: Text(
                            'Pergamino ${pergamino.numero}'), // Manejar el valor nulo aquí
                        // Puedes agregar más detalles y navegación a los sectores aquí
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
