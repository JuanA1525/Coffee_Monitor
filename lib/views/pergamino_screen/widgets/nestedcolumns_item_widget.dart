import 'package:coffee_monitor/models/sector.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class NestedcolumnsItemWidget extends StatelessWidget {
  final Sector sector;

  const NestedcolumnsItemWidget(this.sector, {Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 17.h,
        vertical: 21.v,
      ),
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Container(
        decoration: AppDecoration.fillGray900.copyWith(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                sector.numero.toString(),
                style: theme.textTheme.headlineLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
