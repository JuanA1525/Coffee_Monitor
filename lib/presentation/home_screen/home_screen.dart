import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import 'widgets/weatherinfo_item_widget.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(
          key: key,
        );

  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray5001,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowRoundLef,
                height: 21.adaptSize,
                width: 21.adaptSize,
                alignment: Alignment.centerRight,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgIconDayRainGray90001,
                height: 82.adaptSize,
                width: 82.adaptSize,
                alignment: Alignment.center,
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 14.h,
                  right: 40.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tiempo Estimado",
                      style: theme.textTheme.bodyLarge,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.v),
                      child: Text(
                        "3d 12h",
                        style: CustomTextStyles.bodyLargeBluegray700,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 11.v),
              _buildWeatherDetails(context),
              SizedBox(height: 10.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 14.h,
                  right: 47.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.v),
                      child: Text(
                        "Temperatura ",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.v),
                      child: Text(
                        "22°C",
                        style: CustomTextStyles.bodyLargeBluegray700,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 6.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 14.h,
                  right: 49.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.v),
                      child: Text(
                        "Humedad",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.v),
                      child: Text(
                        "43%",
                        style: CustomTextStyles.bodyLargeBluegray700,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 7.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 14.h,
                  right: 32.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Text(
                        "Luminocidad",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.v),
                      child: Text(
                        "21 W/m²",
                        style: CustomTextStyles.bodyLargeBluegray700,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.v),
              _buildPergaminoColumn(context),
              SizedBox(height: 6.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWeatherDetails(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 13.h,
          right: 21.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Viento",
              style: theme.textTheme.bodyLarge,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(
                "5 m/s - EW",
                style: CustomTextStyles.bodyLargeBluegray700,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPergaminoColumn(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.h),
        child: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 220.v,
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  sliderIndex = index;
                },
              ),
              itemCount: 1,
              itemBuilder: (context, index, realIndex) {
                return WeatherinfoItemWidget();
              },
            ),
            SizedBox(height: 17.v),
            SizedBox(
              height: 10.v,
              child: AnimatedSmoothIndicator(
                activeIndex: sliderIndex,
                count: 1,
                axisDirection: Axis.horizontal,
                effect: ScrollingDotsEffect(
                  spacing: 9.7,
                  activeDotColor: appTheme.lightGreen900,
                  dotColor: appTheme.green300,
                  dotHeight: 10.v,
                  dotWidth: 9.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
