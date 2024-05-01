import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import 'widgets/nestedcolumns_item_widget.dart';
import 'widgets/weatherinfo1_item_widget.dart'; // ignore_for_file: must_be_immutable

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
          padding: EdgeInsets.only(
            left: 20.h,
            right: 20.h,
            top: 5.v,
            bottom: 20.v,
          ),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildListBox(context),
              Text(
                "Pergamino #1",
                style: CustomTextStyles.bodyLarge_1,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Tiempo Estimado",
                              style: theme.textTheme.bodyLarge,
                            ),
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
                              onTapTxtHumedad(context);
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
                              onTapTxtLuminocidad(context);
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
              ),
              _buildNestedColumns(context),
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
      leading: IconButton(
        icon: Icon(Icons.arrow_back), // replace with your desired icon
        iconSize: 30.0, // specify your desired size here
        onPressed: () {
          // handle your button tap here
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildListBox(BuildContext context) {
    return Column(
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
    );
  }

  /// Section Widget
  Widget _buildNestedColumns(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      padding: EdgeInsets.all(5.h),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        children: <Widget>[
          for (int i = 0; i < 3; i++) ...[
            if (i != 0) SizedBox(width: 5.h),
            Expanded(child: NestedcolumnsItemWidget()),
          ],
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWeatherInfo(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      padding: EdgeInsets.all(5.h),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        children: <Widget>[
          for (int i = 0; i < 3; i++) ...[
            if (i != 0) SizedBox(width: 5.h),
            Expanded(child: Weatherinfo1ItemWidget()),
          ],
        ],
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
