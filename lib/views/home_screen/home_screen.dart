import 'package:coffee_monitor/main.dart';
import 'package:coffee_monitor/models/finca.dart';
import 'package:coffee_monitor/views/clima_screen/clima_screen.dart';
import 'package:coffee_monitor/views/pergamino_screen/pergamino_screen.dart';
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
  Finca finca = firestoreService.finca;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: firestoreService.calculateAveragesFinca(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, double> averages = snapshot.data as Map<String, double>;

          double? humAverageFinca = averages['humAverageFinca'];
          double? sunAverageFinca = averages['sunAverageFinca'];
          double? tempAverageFinca = averages['tempAverageFinca'];
          double? airAverageFinca = averages['airAverageFinca'];

          return SafeArea(
            child: Scaffold(
              backgroundColor: appTheme.colorFondo,
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
                      color: Colors.black,
                      onTap: () => setState(() {}),
                      height: 25.adaptSize,
                      width: 25.adaptSize,
                      alignment: Alignment.centerRight,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    ClimaScreen(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin =
                                  Offset(0.0, -1.0); // Start from the top
                              var end = Offset.zero;
                              var curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: CustomImageView(
                        imagePath: ImageConstant.imgIconDayRainGray90001,
                        height: 82.adaptSize,
                        width: 82.adaptSize,
                        alignment: Alignment.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: screenHeight * 0.30, // 30% of screen height
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("Tiempo Estimado",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16.fSize,
                                          color: Color(0xFF364027),
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "3d 5h",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.fSize,
                                        color: Color(0xFF000000)),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Viento",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16.fSize,
                                      color: Color(0xFF364027),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    airAverageFinca.toString() + " m/s",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.fSize,
                                        color: Color(0xFF000000)),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Temperatura",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16.fSize,
                                      color: Color(0xFF364027),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    tempAverageFinca.toString() + " °C",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.fSize,
                                        color: Color(0xFF000000)),
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
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.fSize,
                                        color: Color(0xFF364027),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    humAverageFinca.toString() + " %",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.fSize,
                                        color: Color(0xFF000000)),
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
                                      "Tiempo Solar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.fSize,
                                        color: Color(0xFF364027),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    sunAverageFinca.toString() + " h",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.fSize,
                                        color: Color(0xFF000000)),
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
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
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
              autoPlay: false,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  sliderIndex = index;
                });
              },
            ),
            itemCount: finca.pergaminoList.length,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0), // Add horizontal padding
                child: GestureDetector(
                  onTap: () {
                    print("Indice de Pergamino: " + index.toString());
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            PergaminoScreen(finca.pergaminoList[index]),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = Offset(1.0, 0.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: WeatherinfoItemWidget(finca.pergaminoList[index]),
                ),
              );
            },
          ),
          SizedBox(height: screenHeight * 0.03), // 2% of screen height
          SizedBox(
            height: screenHeight * 0.01, // 1% of screen height
            child: AnimatedSmoothIndicator(
              activeIndex: sliderIndex,
              count: finca.pergaminoList.length,
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
