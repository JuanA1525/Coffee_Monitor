import 'package:coffee_monitor/models/pergamino.dart';
import 'package:coffee_monitor/presentation/grafica_screen/grafica_screen.dart';
import 'package:coffee_monitor/services/firebase_service.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'widgets/nestedcolumns_item_widget.dart';
import 'widgets/weatherinfo1_item_widget.dart'; // ignore_for_file: must_be_immutable

class PergaminoScreen extends StatefulWidget {
  final Pergamino pergamino;

  PergaminoScreen(this.pergamino, {Key? key}) : super(key: key);

  @override
  _PergaminoScreenState createState() => _PergaminoScreenState();
}

class _PergaminoScreenState extends State<PergaminoScreen> {
  List<Pergamino> dropdownItemList =
      FirestoreService.instance.finca.pergaminoList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService.instance
            .calculateAveragesPergamino(widget.pergamino),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, double> averages = snapshot.data as Map<String, double>;

            double? humAveragePergamino = averages['humAveragePergamino'];
            double? sunAveragePergamino = averages['sunAveragePergamino'];
            double? tempAveragePergamino = averages['tempAveragePergamino'];
            double? airAveragePergamino = averages['airAveragePergamino'];
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.refresh),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ],
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    left: 25.h,
                    right: 25.h,
                    top: 5.v,
                    bottom: 20.v,
                  ),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Pergamino #" + widget.pergamino.numero.toString(),
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
                                    style:
                                        CustomTextStyles.bodyLargeBluegray700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GraficaScreen(
                                                widget.pergamino)),
                                      );
                                    },
                                    child: Text(
                                      "Viento",
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    airAveragePergamino.toString() + " m/s",
                                    textAlign: TextAlign.center,
                                    style:
                                        CustomTextStyles.bodyLargeBluegray700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GraficaScreen(
                                                widget
                                                    .pergamino)), // replace NewPage with the actual page you want to navigate to
                                      );
                                    },
                                    child: Text(
                                      "Temperatura",
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    tempAveragePergamino.toString() + " °C",
                                    textAlign: TextAlign.center,
                                    style:
                                        CustomTextStyles.bodyLargeBluegray700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GraficaScreen(
                                                widget
                                                    .pergamino)), // replace NewPage with the actual page you want to navigate to
                                      );
                                    },
                                    child: Text(
                                      "Humedad",
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    humAveragePergamino.toString() + " %",
                                    textAlign: TextAlign.center,
                                    style:
                                        CustomTextStyles.bodyLargeBluegray700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GraficaScreen(
                                                widget
                                                    .pergamino)), // replace NewPage with the actual page you want to navigate to
                                      );
                                    },
                                    child: Text(
                                      "Tiempo Solar",
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    sunAveragePergamino.toString() + " h",
                                    textAlign: TextAlign.center,
                                    style:
                                        CustomTextStyles.bodyLargeBluegray700,
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
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  /// Section Widget
  // ignore: unused_element
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back), // replace with your desired icon
        iconSize: 30.0, // specify your desired size here
        onPressed: () {
          print("Button Pressed");
          Navigator.pop(context);
        },
      ),
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
          for (int i = 0; i < widget.pergamino.sectorList.length; i++) ...[
            if (i != 0) SizedBox(width: 5.h),
            Expanded(
                child: NestedcolumnsItemWidget(widget.pergamino.sectorList[i])),
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
          for (int i = 0; i < widget.pergamino.sectorList.length; i++) ...[
            if (i != 0) SizedBox(width: 5.h),
            Expanded(
                child: Weatherinfo1ItemWidget(widget.pergamino.sectorList[i],
                    widget.pergamino.sectorList.length)),
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
