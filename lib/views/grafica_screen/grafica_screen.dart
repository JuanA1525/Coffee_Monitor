import 'package:coffee_monitor/main.dart';
import 'package:coffee_monitor/models/pergamino.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class GraficaScreen extends StatefulWidget {
  final Pergamino pergamino;

  const GraficaScreen(this.pergamino, {Key? key})
      : super(
          key: key,
        );

  @override
  _GraficaScreenState createState() => _GraficaScreenState();
}

class _GraficaScreenState extends State<GraficaScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.colorFondo,
        appBar: AppBar(
          backgroundColor: appTheme.verdeOscuro,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 30.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              color: Colors.white,
              iconSize: 30.0,
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 10.v),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text(
                      "Gráficas de Pergamino #" +
                          widget.pergamino.numero.toString(),
                      style: TextStyle(
                        fontSize: 22.fSize,
                        color: appTheme.verdeOscuro,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text(
                      "Tiempo x Humedad Relativa (%)",
                      style: TextStyle(
                        fontSize: 16.fSize,
                        color: appTheme.verdeOscuro,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 165.v,
                    width: 288.h,
                    child: sensorDataService.generateGraphForPergamino(
                        widget.pergamino, 'hum'),
                  ),
                ),
                Divider(),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text(
                      "Tiempo x Temperatura (°C)",
                      style: TextStyle(
                        fontSize: 16.fSize,
                        color: appTheme.verdeOscuro,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 165.v,
                    width: 288.h,
                    child: sensorDataService.generateGraphForPergamino(
                        widget.pergamino, 'temp'),
                  ),
                ),
                Divider(),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text(
                      "Tiempo x Exposición Solar (h)",
                      style: TextStyle(
                        fontSize: 16.fSize,
                        color: appTheme.verdeOscuro,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 165.v,
                    width: 288.h,
                    child: sensorDataService.generateGraphForPergamino(
                        widget.pergamino, 'sun'),
                  ),
                ),
                Divider(),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text(
                      "Tiempo x Velocidad del Viento (m/s)",
                      style: TextStyle(
                        fontSize: 16.fSize,
                        color: appTheme.verdeOscuro,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 165.v,
                    width: 288.h,
                    child: sensorDataService.generateGraphForPergamino(
                        widget.pergamino, 'air'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
