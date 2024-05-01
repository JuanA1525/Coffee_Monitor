import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class GraficaScreen extends StatelessWidget {
  const GraficaScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 30.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 10.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Text(
                  "Titulo Grafica #1",
                  style: CustomTextStyles.bodyMediumGreen900,
                ),
              ),
              Container(
                height: 165.v,
                width: 288.h,
                margin: EdgeInsets.only(left: 4.h),
                decoration: BoxDecoration(
                  color: appTheme.blueGray100,
                ),
              ),
              SizedBox(height: 11.v),
              Text(
                "Titulo Grafica #2",
                style: CustomTextStyles.bodyMediumGreen900,
              ),
              SizedBox(height: 5.v),
              Container(
                height: 165.v,
                width: 288.h,
                margin: EdgeInsets.only(left: 4.h),
                decoration: BoxDecoration(
                  color: appTheme.blueGray100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
