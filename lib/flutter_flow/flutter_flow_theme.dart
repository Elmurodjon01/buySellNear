// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color unset;
  late Color sub1;
  late Color mainC;
  late Color main1;
  late Color main2;
  late Color main3;
  late Color backG1;
  late Color backG2;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF39B8D2);
  late Color secondary = const Color(0xFF39D2C0);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFFF5963);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF57636C);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xC2FFFFFF);
  late Color accent1 = const Color(0xFF616161);
  late Color accent2 = const Color(0xFF757575);
  late Color accent3 = const Color(0xFFE0E0E0);
  late Color accent4 = const Color(0xFFEEEEEE);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color unset = Color(0x00FFFFFF);
  late Color sub1 = Color(0xFF000000);
  late Color mainC = Color(0xFFA1B231);
  late Color main1 = Color(0xFFFFAC00);
  late Color main2 = Color(0xFFFFD200);
  late Color main3 = Color(0xFFBBDD00);
  late Color backG1 = Color(0x5A000000);
  late Color backG2 = Color(0x60FFFFFF);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Pretendard';
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: theme.sub1,
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
      );
  String get displayMediumFamily => 'Pretendard';
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: theme.sub1,
        fontWeight: FontWeight.bold,
        fontSize: 35.0,
      );
  String get displaySmallFamily => 'Pretendard';
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      );
  String get headlineLargeFamily => 'Pretendard';
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 26.0,
      );
  String get headlineMediumFamily => 'Pretendard';
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'Pretendard';
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
      );
  String get titleLargeFamily => 'Pretendard';
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Pretendard';
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Pretendard';
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Pretendard';
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
      );
  String get labelMediumFamily => 'Pretendard';
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Pretendard';
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 13.0,
      );
  String get bodyLargeFamily => 'Pretendard';
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyMediumFamily => 'Pretendard';
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 11.0,
      );
  String get bodySmallFamily => 'Pretendard';
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Pretendard';
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 44.0,
      );
  String get displayMediumFamily => 'Pretendard';
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 38.0,
      );
  String get displaySmallFamily => 'Pretendard';
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
      );
  String get headlineLargeFamily => 'Pretendard';
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineMediumFamily => 'Pretendard';
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 26.0,
      );
  String get headlineSmallFamily => 'Pretendard';
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Pretendard';
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Pretendard';
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleSmallFamily => 'Pretendard';
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get labelLargeFamily => 'Pretendard';
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17.0,
      );
  String get labelMediumFamily => 'Pretendard';
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelSmallFamily => 'Pretendard';
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
      );
  String get bodyLargeFamily => 'Pretendard';
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodyMediumFamily => 'Pretendard';
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 13.0,
      );
  String get bodySmallFamily => 'Pretendard';
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Pretendard';
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 75.0,
      );
  String get displayMediumFamily => 'Pretendard';
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 65.0,
      );
  String get displaySmallFamily => 'Pretendard';
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 55.0,
      );
  String get headlineLargeFamily => 'Pretendard';
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 45.0,
      );
  String get headlineMediumFamily => 'Pretendard';
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 39.0,
      );
  String get headlineSmallFamily => 'Pretendard';
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 34.0,
      );
  String get titleLargeFamily => 'Pretendard';
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get titleMediumFamily => 'Pretendard';
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 30.0,
      );
  String get titleSmallFamily => 'Pretendard';
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 28.0,
      );
  String get labelLargeFamily => 'Pretendard';
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 26.0,
      );
  String get labelMediumFamily => 'Pretendard';
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get labelSmallFamily => 'Pretendard';
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 22.0,
      );
  String get bodyLargeFamily => 'Pretendard';
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
      );
  String get bodyMediumFamily => 'Pretendard';
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get bodySmallFamily => 'Pretendard';
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'Pretendard',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
