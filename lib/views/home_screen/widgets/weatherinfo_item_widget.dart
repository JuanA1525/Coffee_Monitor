import 'package:coffee_monitor/models/pergamino.dart';
import 'package:coffee_monitor/services/firebase_service.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class WeatherinfoItemWidget extends StatelessWidget {
  final Pergamino pergamino;

  const WeatherinfoItemWidget(this.pergamino, {Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreService.instance.calculateAveragesPergamino(pergamino),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, double> averages = snapshot.data as Map<String, double>;

          double? humAveragePergamino = averages['humAveragePergamino'];
          double? sunAveragePergamino = averages['sunAveragePergamino'];
          double? tempAveragePergamino = averages['tempAveragePergamino'];
          double? airAveragePergamino = averages['airAveragePergamino'];

          return Container(
            padding: EdgeInsets.only(
              bottom: 5.v,
            ),
            decoration: AppDecoration.outlineBlack.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder26,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Pergamino #" + pergamino.numero.toString(),
                  style: TextStyle(
                      fontSize: 22.fSize,
                      color: Color(0xFFCED9B8),
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text("Tiempo",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.fSize,
                              color: Color(0xFFCED9B8),
                              fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: Text(
                        "3d 12h",
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyLargeBluegray700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Viento",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.fSize,
                            color: Color(0xFFCED9B8),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        airAveragePergamino.toString() + " m/s",
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyLargeBluegray700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Temperatura",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.fSize,
                            color: Color(0xFFCED9B8),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        tempAveragePergamino.toString() + " °C",
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyLargeBluegray700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //onTapTxtHumedad(context);
                        },
                        child: Text(
                          "Humedad",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.fSize,
                              color: Color(0xFFCED9B8),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        humAveragePergamino.toString() + " %",
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyLargeBluegray700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //onTapTxtLuminocidad(context);
                        },
                        child: Text(
                          "Tiempo Solar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.fSize,
                              color: Color(0xFFCED9B8),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        sunAveragePergamino.toString() + " h",
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyLargeBluegray700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
