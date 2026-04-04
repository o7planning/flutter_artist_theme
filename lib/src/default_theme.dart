import 'package:flutter/material.dart';

import 'core.dart';

/// =============================================================
/// DEFAULT THEME
/// =============================================================
class DefaultTheme extends FaTheme {
  @override
  String get name => FaThemeHub.defaultThemeName;

  @override
  IconData get icon => Icons.business_center_outlined;

  @override
  Color get seedColor => const Color(0xFF056AB4);

  @override
  Brightness get brightness => Brightness.light;

  @override
  String? get fontFamily => null;

  @override
  FaThemeTokens createThemeTokens() {
    final colors = const FaColorTokens(
      brightness: Brightness.light,

      primary: Color(0xFF056AB4),
      onPrimary: Colors.white,

      secondary: Color(0xFFFF9900),
      onSecondary: Colors.black,

      tertiary: Color(0xFF22C55E),
      onTertiary: Colors.white,

      error: Color(0xFFDC2626),
      onError: Colors.white,

      background: Color(0xFFE7F0FC),
      surface: Colors.white,

      onSurface: Color(0xFF10324A),
      onSurfaceVariant: Color(0xFF5F6B7A),

      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF1F7FE),
      surfaceContainer: Color(0xFFE1EDF9),
      surfaceContainerHigh: Color(0xFFD6E4F2),
      surfaceContainerHighest: Color(0xFFCCD9E7),

      textPrimary: Color(0xFF10324A),
      textSecondary: Color(0xFF5F6B7A),

      border: Color(0xFFCCD9E7),
      outline: Color(0xFFB8C6D8),
      outlineVariant: Color(0xFFCCD9E7),

      shadow: Colors.black,
      scrim: Colors.black54,

      inverseSurface: Color(0xFF1B2A38),
      onInverseSurface: Colors.white,
      inversePrimary: Color(0xFF9CCBFF),

      divider: Color(0xFFCCD9E7),
    );

    return FaThemeTokens(
      colors: colors,

      spacing: const FaSpacingTokens(xs: 4, sm: 8, md: 12, lg: 16, xl: 24),

      elevation: const FaElevationTokens(level1: 2, level2: 4, level3: 6),

      radius: const FaRadiusTokens(sm: 4, md: 8, lg: 12, xl: 16),

      typography: const FaTypographyTokens(
        body: TextStyle(fontSize: 14, fontFamily: "Ubuntu"),
        title: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Ubuntu",
        ),
        caption: TextStyle(fontSize: 12, fontFamily: "Ubuntu"),
      ),

      components: const FaComponentTokens(),

      layout: const FaLayoutTokens(sidebarWidth: 260, contentMaxWidth: 1200),

      layoutColors: const FaLayoutColorTokens(
        sidebarSurface: Color(0xFF10324A),
        onSidebarSurface: Colors.white,
        topbarSurface: Colors.white,
        onTopbarSurface: Color(0xFF056AB4),
      ),

      motion: const FaMotionTokens(),
    );
  }
}
