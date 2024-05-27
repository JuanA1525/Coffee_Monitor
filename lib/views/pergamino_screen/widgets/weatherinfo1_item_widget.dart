import 'package:coffee_monitor/models/sector.dart';
import 'package:coffee_monitor/services/firebase_service.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class Weatherinfo1ItemWidget extends StatelessWidget {
  final Sector sector;
  final int numSectors;
  const Weatherinfo1ItemWidget(this.sector, this.numSectors, {Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreService.instance.getMostRecentData(sector),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, double> dataSector = snapshot.data as Map<String, double>;

          double? humSector = dataSector['hum'];
          double? sunSector = dataSector['sun'];
          double? tempSector = dataSector['temp'];
          double? airSector = dataSector['air'];

          dynamic estilo;
          if (numSectors == 3) {
            estilo = TextStyle(
              fontSize: 9.fSize,
              color: Colors.black,
            );
          } else {
            estilo = TextStyle(
              fontSize: 14.fSize,
              color: Colors.black,
            );
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 6.h),
            decoration: AppDecoration.fillGray50.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            width: 88.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 26.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillGray900.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text("Vi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.fSize,
                              color: appTheme.colorFondo,
                            )),
                      ),
                      Expanded(
                        child: Text(
                          airSector.toString() + " m/s",
                          style: estilo as TextStyle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 26.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillGray900.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text("Te",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.fSize,
                              color: appTheme.colorFondo,
                            )),
                      ),
                      Expanded(
                        child: Text(
                          tempSector.toString() + " °C",
                          textAlign: TextAlign.center,
                          style: estilo,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 26.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillGray900.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text("Hu",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.fSize,
                              color: appTheme.colorFondo,
                            )),
                      ),
                      Expanded(
                        child: Text(
                          humSector.toString() + " %",
                          style: estilo,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 26.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillGray900.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text("Ts",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.fSize,
                              color: appTheme.colorFondo,
                            )),
                      ),
                      Expanded(
                        child: Text(
                          sunSector.toString() + " h",
                          style: estilo,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )
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
