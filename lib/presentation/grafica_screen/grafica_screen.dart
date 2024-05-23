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
        appBar: AppBar(
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
                      style: CustomTextStyles.bodyLargeBluegray700,
                    ),
                  ),
                ),
                Divider(),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text(
                      "Tiempo x Humedad Relativa (%)",
                      style: CustomTextStyles.bodyLarge16,
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
                      style: CustomTextStyles.bodyLarge16,
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
                      style: CustomTextStyles.bodyLarge16,
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
                      style: CustomTextStyles.bodyLarge16,
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
