import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class WeatherinfoItemWidget extends StatelessWidget {
  const WeatherinfoItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
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
            "Pergamino #1",
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
                  "5 m/s - EW",
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
                  "22 °C",
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
                  "43%",
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
                    "Luminocidad",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "21 W/m²",
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyLargeBluegray700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
