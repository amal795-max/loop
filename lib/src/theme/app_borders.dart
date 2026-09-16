import 'package:flutter/material.dart';

/// Reusable border radii and border shapes used across the app.
///
/// Usage:
/// ```dart
/// Container(decoration: BoxDecoration(borderRadius: AppBorders.md))
/// ```
abstract final class AppBorders {
  AppBorders._();

  // ── Border Radii ──────────────────────────────────────────────────────────

  /// 4 pt — sm rounding
  static const BorderRadius sm4 = BorderRadius.all(Radius.circular(4));

  /// 8 pt — default rounding
  static const BorderRadius default8 = BorderRadius.all(Radius.circular(8));

  /// 12 pt — md rounding
  static const BorderRadius md12 = BorderRadius.all(Radius.circular(12));

  /// 16 pt — lg rounding
  static const BorderRadius lg16 = BorderRadius.all(Radius.circular(16));

  /// 24 pt — xl rounding
  static const BorderRadius xl24 = BorderRadius.all(Radius.circular(24));

  /// Fully circular (pill/stadium shape).
  static const BorderRadius full = BorderRadius.all(Radius.circular(9999));

  // ── Semantic aliases ──────────────────────────────────────────────────────

  /// Default button border radius (per DESIGN.md: 16px).
  static const BorderRadius button = lg16;

  /// Default card border radius (per DESIGN.md: 16px).
  static const BorderRadius card = lg16;

  /// Default input field border radius (per DESIGN.md: 24px/pill).
  static const BorderRadius input = xl24;

  /// Default dialog border radius.
  static const BorderRadius dialog = xl24;
  
  /// Message Bubbles (Asymmetric rounding from DESIGN.md)
  static const BorderRadius outgoingBubble = BorderRadius.only(
    topLeft: Radius.circular(18),
    topRight: Radius.circular(18),
    bottomRight: Radius.circular(4),
    bottomLeft: Radius.circular(18),
  );

  static const BorderRadius incomingBubble = BorderRadius.only(
    topLeft: Radius.circular(18),
    topRight: Radius.circular(18),
    bottomRight: Radius.circular(18),
    bottomLeft: Radius.circular(4),
  );

  // ── RoundedRectangleBorder shapes (for ShapeBorder APIs) ─────────────────

  static const RoundedRectangleBorder shapeSm = RoundedRectangleBorder(
    borderRadius: sm4,
  );

  static const RoundedRectangleBorder shapeMd = RoundedRectangleBorder(
    borderRadius: md12,
  );

  static const RoundedRectangleBorder shapeLg = RoundedRectangleBorder(
    borderRadius: lg16,
  );

  static const StadiumBorder stadium = StadiumBorder();
}
