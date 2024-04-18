import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class ClimaScreen extends StatelessWidget {
  const ClimaScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 57.h,
            vertical: 30.v,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgIconDayRain,
                height: 97.v,
                width: 98.h,
              ),
              SizedBox(height: 16.v),
              Text(
                "22°C / 43% / 5 ms - EW",
                style: CustomTextStyles.bodyLargeGray90001,
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }
}
