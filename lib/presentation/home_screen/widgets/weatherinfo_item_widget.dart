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
        horizontal: 7.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pergamino #1",
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 17.v),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              right: 17.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "Tiempo Estimado: ",
                    style: CustomTextStyles.bodyLarge16_1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 3.v),
                  child: Text(
                    "3d 12h",
                    style: theme.textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Viento:",
                  style: CustomTextStyles.bodyLarge16_1,
                ),
                Text(
                  "5 m/s - EW",
                  style: theme.textTheme.bodyMedium,
                )
              ],
            ),
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              right: 24.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "Temperatura: ",
                    style: CustomTextStyles.bodyLarge16_1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 3.v),
                  child: Text(
                    "22°C",
                    style: theme.textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                right: 25.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Humedad:",
                    style: CustomTextStyles.bodyLarge16_1,
                  ),
                  Text(
                    "43%",
                    style: theme.textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Luminocidad:",
                  style: CustomTextStyles.bodyLarge16_1,
                ),
                Text(
                  "21 W/m²",
                  style: theme.textTheme.bodyMedium,
                )
              ],
            ),
          ),
          SizedBox(height: 2.v)
        ],
      ),
    );
  }
}
