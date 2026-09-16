import 'package:flutter/material.dart';

/// App-specific colors that aren't part of the standard [ColorScheme].
/// Access via `context.appColors` (defined in `context_extension.dart`).
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
    this.successContainer,
    this.onSuccessContainer,
    this.warningContainer,
    this.onWarningContainer,
    this.infoContainer,
    this.onInfoContainer,
  });

  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;
  final Color? successContainer;
  final Color? onSuccessContainer;
  final Color? warningContainer;
  final Color? onWarningContainer;
  final Color? infoContainer;
  final Color? onInfoContainer;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? infoContainer,
    Color? onInfoContainer,
  }) {
    return AppColorsExtension(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      successContainer: Color.lerp(successContainer, other.successContainer, t),
      onSuccessContainer: Color.lerp(onSuccessContainer, other.onSuccessContainer, t),
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t),
      onWarningContainer: Color.lerp(onWarningContainer, other.onWarningContainer, t),
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t),
      onInfoContainer: Color.lerp(onInfoContainer, other.onInfoContainer, t),
    );
  }
}

/// Helper class to define the actual color palettes
class AppPalettes {
  AppPalettes._();

  static const light = AppColorsExtension(
    success: Color(0xFF1A365D),          // Midnight blue (success state)
    onSuccess: Colors.white,
    successContainer: Color(0xFFF1F5F9), // Neutral bubble
    onSuccessContainer: Color(0xFF0F172A),

    warning: Color(0xFFED6C02),          // Amber (consistent with design tone)
    onWarning: Colors.white,
    warningContainer: Color(0xFFFFF4E5), // Soft warm container
    onWarningContainer: Color(0xFF7A3E00),

    info: Color(0xFF2563EB),             // Action Accent
    onInfo: Colors.white,
    infoContainer: Color(0xFFDCE9FF),    // Light blue container
    onInfoContainer: Color(0xFF003EA8),

  );
  static const dark = AppColorsExtension(
    success: Color(0xFFADC7F7),          // tertiary-fixed-dim
    onSuccess: Color(0xFF001B3C),
    successContainer: Color(0xFF0F2137), // primary-container
    onSuccessContainer: Color(0xFFCBD5E1),

    warning: Color(0xFFFFB74D),
    onWarning: Color(0xFF4A2C00),
    warningContainer: Color(0xFFE65100),
    onWarningContainer: Color(0xFFFFE8C2),

    info: Color(0xFF4F7FFF),             // brighter accent for dark mode
    onInfo: Colors.white,
    infoContainer: Color(0xFF1A365D),
    onInfoContainer: Color(0xFFB6C8E4),

  );

}

/// Access semantic colors via `context.appColors` from `context_extension.dart`.
/// Example: `context.appColors.success`
