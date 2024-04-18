import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class Weatherinfo1ItemWidget extends StatelessWidget {
  const Weatherinfo1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      width: 88.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 26.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillGray900.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "Vi",
                    style: CustomTextStyles.bodySmallWhiteA70012_1,
                  ),
                ),
                Expanded(
                  child: Text(
                    "5 m/s",
                    style: CustomTextStyles.bodySmall_1,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 26.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillGray900.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "Te",
                    style: CustomTextStyles.bodySmallWhiteA70012,
                  ),
                ),
                Expanded(
                  child: Text(
                    "22°C",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 26.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillGray900.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "Hu",
                    style: CustomTextStyles.bodySmallWhiteA700,
                  ),
                ),
                Expanded(
                  child: Text(
                    "43%",
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 26.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillGray900.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "Lu",
                    style: CustomTextStyles.bodySmallWhiteA700,
                  ),
                ),
                Expanded(
                  child: Text(
                    "21 W/m²",
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
