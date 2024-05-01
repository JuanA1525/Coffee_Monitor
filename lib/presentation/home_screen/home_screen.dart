import 'package:coffee_monitor/presentation/pergamino_screen/pergamino_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import 'widgets/weatherinfo_item_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray5001,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 20.h,
            right: 20.h,
            top: 5.v,
            bottom: 10.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: screenHeight * 0.30, // 30% of screen height
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
                ),
              ),
              _buildPergaminoColumn(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPergaminoColumn(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: screenHeight * 0.35, // 35% of screen height
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  sliderIndex = index;
                });
              },
            ),
            itemCount: 4,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0), // Add horizontal padding
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PergaminoScreen()), // replace NewPage with the actual page you want to navigate to
                    );
                  },
                  child: WeatherinfoItemWidget(),
                ),
              );
            },
          ),
          SizedBox(height: screenHeight * 0.03), // 2% of screen height
          SizedBox(
            height: screenHeight * 0.01, // 1% of screen height
            child: AnimatedSmoothIndicator(
              activeIndex: sliderIndex,
              count: 4,
              axisDirection: Axis.horizontal,
              effect: ScrollingDotsEffect(
                spacing: 10,
                activeDotColor: appTheme.lightGreen900,
                dotColor: appTheme.green300,
                dotHeight: 12,
                dotWidth: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
