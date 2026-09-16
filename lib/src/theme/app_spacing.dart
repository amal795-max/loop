import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Named spacing constants aligned with an 8-pt grid.
///
/// Usage:
/// ```dart
/// SizedBox(height: AppSpacing.md)        // 16 pt gap
/// Padding(padding: EdgeInsets.all(AppSpacing.lg))
/// ```
abstract final class AppSpacing {
  AppSpacing._();

  static const double _xxs = 4;
  static const double _xs = 8;
  static const double _sm = 12;
  static const double _md = 16;
  static const double _lg = 20;
  static const double _xl = 24;
  static const double _xxl = 32;
  static const double _xxxl = 40;

  /// 4 pt — tightest spacing.
  static double get xxs => _xxs.r;

  /// 8 pt — small spacing.
  static double get xs => _xs.r;

  /// 12 pt — medium-small.
  static double get sm => _sm.r;

  /// 16 pt — base unit, standard component padding.
  static double get md => _md.r;

  /// 20 pt — medium-large.
  static double get lg => _lg.r;

  /// 24 pt — large.
  static double get xl => _xl.r;

  /// 32 pt — extra large.
  static double get xxl => _xxl.r;

  /// 40 pt — maximum.
  static double get xxxl => _xxxl.r;

  // ── Semantic aliases ──────────────────────────────────────────────────────

  /// Standard horizontal page margin.
  static double get pagePadding => md;

  /// Gap between list/grid items.
  static double get itemGap => xs;

  /// Inner padding for cards.
  static double get cardPadding => md;

  /// Vertical gap between form fields.
  static double get formFieldGap => sm;
}

