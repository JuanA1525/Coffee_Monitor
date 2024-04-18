import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import 'widgets/nestedcolumns_item_widget.dart';
import 'widgets/weatherinfo1_item_widget.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class PergaminoScreen extends StatelessWidget {
  PergaminoScreen({Key? key})
      : super(
          key: key,
        );

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            children: [
              _buildListBox(context),
              SizedBox(height: 14.v),
              Text(
                "Pergamino #1",
                style: CustomTextStyles.bodyLarge_1,
              ),
              SizedBox(height: 14.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 17.h,
                    right: 34.h,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Tiempo Estimado",
                        style: theme.textTheme.bodyLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 33.h,
                          bottom: 2.v,
                        ),
                        child: Text(
                          "3d 12h",
                          style: CustomTextStyles.bodyLargeBluegray700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3.v),
              SizedBox(
                height: 63.v,
                width: 240.h,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 58.h,
                        child: Text(
                          "5 m/s - EW",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyLargeBluegray700.copyWith(
                            height: 1.25,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          onTapTxtViento(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 3.v),
                          child: Text(
                            "Viento",
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 37.v,
                          right: 11.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                onTapTxtTemperatura(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 3.v),
                                child: Text(
                                  "Temperatura ",
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6.v),
                              child: Text(
                                "22°C",
                                style: CustomTextStyles.bodyLargeBluegray700,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 17.h,
                    right: 43.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onTapTxtHumedad(context);
                        },
                        child: Text(
                          "Humedad",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      Text(
                        "43%",
                        style: CustomTextStyles.bodyLargeBluegray700,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 17.h,
                  right: 26.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onTapTxtLuminocidad(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 4.v),
                        child: Text(
                          "Luminocidad",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 7.v),
                      child: Text(
                        "21 W/m²",
                        style: CustomTextStyles.bodyLargeBluegray700,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16.v),
              _buildNestedColumns(context),
              SizedBox(height: 18.v),
              _buildWeatherInfo(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 319.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowUp1ArrowUpKeyboard,
        margin: EdgeInsets.fromLTRB(15.h, 6.v, 285.h, 7.v),
      ),
    );
  }

  /// Section Widget
  Widget _buildListBox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 17.h,
        right: 19.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pergaminos",
            style: theme.textTheme.titleMedium,
          ),
          CustomDropDown(
            icon: Container(
              margin: EdgeInsets.symmetric(horizontal: 19.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowdown,
                height: 3.v,
                width: 8.h,
              ),
            ),
            hintText: "Seelcciona el Pergamino",
            items: dropdownItemList,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNestedColumns(BuildContext context) {
    return Container(
      height: 107.v,
      padding: EdgeInsets.all(5.h),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 6.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return NestedcolumnsItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildWeatherInfo(BuildContext context) {
    return Container(
      height: 106.v,
      padding: EdgeInsets.all(5.h),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 6.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return Weatherinfo1ItemWidget();
        },
      ),
    );
  }

  /// Navigates to the graficaScreen when the action is triggered.
  onTapTxtViento(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.graficaScreen);
  }

  /// Navigates to the graficaScreen when the action is triggered.
  onTapTxtTemperatura(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.graficaScreen);
  }

  /// Navigates to the graficaScreen when the action is triggered.
  onTapTxtHumedad(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.graficaScreen);
  }

  /// Navigates to the graficaScreen when the action is triggered.
  onTapTxtLuminocidad(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.graficaScreen);
  }
}
