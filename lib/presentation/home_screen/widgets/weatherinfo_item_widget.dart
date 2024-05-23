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
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              //vertical: 5.v,
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
                  style: theme.textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Tiempo",
                        style: theme.textTheme.bodyLarge,
                      ),
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
                        style: theme.textTheme.bodyLarge,
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
                        style: theme.textTheme.bodyLarge,
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
                          style: theme.textTheme.bodyLarge,
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
                          style: theme.textTheme.bodyLarge,
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
