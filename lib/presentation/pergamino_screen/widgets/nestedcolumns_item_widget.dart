import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class NestedcolumnsItemWidget extends StatelessWidget {
  const NestedcolumnsItemWidget({Key? key})
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
      width: 88.h,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 5.v,
        ),
        decoration: AppDecoration.fillGray900.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder26,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1",
              style: theme.textTheme.headlineLarge,
            )
          ],
        ),
      ),
    );
  }
}
