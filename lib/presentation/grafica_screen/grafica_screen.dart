import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class GraficaScreen extends StatelessWidget {
  const GraficaScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 12.h),
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

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 44.v,
      centerTitle: true,
      title: AppbarTitle(
        text: "Caracteristica - Pergamino #1",
      ),
    );
  }
}
