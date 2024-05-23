import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/app_export.dart';

class ClimaScreen extends StatefulWidget {
  const ClimaScreen({Key? key})
      : super(
          key: key,
        );

  @override
  _ClimaScreenState createState() => _ClimaScreenState();
}

class _ClimaScreenState extends State<ClimaScreen> {
  final dateFormat = DateFormat('dd/MM');

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<DateTime> dates = [
      now.subtract(Duration(days: 2)),
      now.subtract(Duration(days: 1)),
      now,
      now.add(Duration(days: 1)),
      now.add(Duration(days: 2)),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 30.0,
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
              SizedBox(height: 15.v),
              Container(
                height: 40, // Set a specific height for the Container
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '22°C',
                      style: TextStyle(fontSize: 23),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    Text(
                      '43%',
                      style: TextStyle(fontSize: 23),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    Text(
                      '5 ms - EW',
                      style: TextStyle(fontSize: 23),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.v),
              Text(
                "Estimados de Clima",
                style: TextStyle(fontSize: 23),
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
                    children: dates.map((date) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Wrap(
                            children: [
                              Text(
                                dateFormat.format(date),
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
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
