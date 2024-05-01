import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  // ignore: unused_element
  TextStyle get inder {
    return copyWith(
      fontFamily: 'Inder',
    );
  }

  // ignore: unused_element
  TextStyle get inriaSerif {
    return copyWith(
      fontFamily: 'Inria Serif',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 16.fSize,
      );
  static get bodyLarge16_1 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 16.fSize,
      );
  static get bodyLargeBluegray700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray700,
        fontSize: 16.fSize,
      );
  static get bodyLargeGray90001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray90001,
      );
  static get bodyLargeMontserratGray700 =>
      theme.textTheme.bodyLarge!.montserrat.copyWith(
        color: appTheme.gray700,
        fontSize: 16.fSize,
      );
  static get bodyLarge_1 => theme.textTheme.bodyLarge!;
  static get bodyMediumGreen900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.green900,
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12.fSize,
      );
  static get bodySmallWhiteA70012 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12.fSize,
      );
  static get bodySmallWhiteA70012_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12.fSize,
      );
  static get bodySmall_1 => theme.textTheme.bodySmall!;
}
