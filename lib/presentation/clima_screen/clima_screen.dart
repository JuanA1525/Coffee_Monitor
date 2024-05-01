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
            horizontal: 20.h,
            vertical: 30.v,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgIconDayRain,
                height: 100.v,
                width: 100.h,
              ),
              SizedBox(height: 20.v),
              Container(
                height: 40, // Set a specific height for the Container
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '22°C',
                      style: TextStyle(fontSize: 25),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    Text(
                      '43%',
                      style: TextStyle(fontSize: 25),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    Text(
                      '5 ms - EW',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Text(
                "Estimados de Clima",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 10.v),
              Table(
                border: TableBorder.all(
                    color: Colors.black, width: 2), // Add this line
                children: [
                  TableRow(
                    children: List.filled(
                      5,
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgIconDayRain,
                          height: 25.v,
                          width: 25.h,
                        ),
                      ),
                    ),
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Wrap(
                            children: [
                              Text(
                                '12/12',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Wrap(
                            children: [
                              Text(
                                '12/12',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Wrap(
                            children: [
                              Text(
                                '12/12',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Wrap(
                            children: [
                              Text(
                                '12/12',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Wrap(
                            children: [
                              Text(
                                '12/12',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
