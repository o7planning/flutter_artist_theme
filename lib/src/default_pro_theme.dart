import 'package:flutter/material.dart';

import 'core.dart';

class DefaultProTheme extends FaTheme {
  @override
  String get name => FaThemeHub.defaultProThemeName;

  @override
  IconData get icon => Icons.auto_awesome_mosaic_rounded;

  @override
  Color get seedColor => const Color(0xFF355CA8);

  @override
  Brightness get brightness => Brightness.light;

  @override
  String? get fontFamily => null;

  @override
  FaThemeTokens createThemeTokens() {
    final colors = const FaColorTokens(
      brightness: Brightness.light,

      primary: Color(0xFF355CA8),
      onPrimary: Colors.white,

      secondary: Color(0xFF06B6D4),
      onSecondary: Colors.white,

      tertiary: Color(0xFF7C3AED),
      onTertiary: Colors.white,

      error: Color(0xFFDC2626),
      onError: Colors.white,

      background: Color(0xFFF8FAFD),
      surface: Colors.white,

      onSurface: Color(0xFF191C20),
      onSurfaceVariant: Color(0xFF44474E),

      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF8FAFD),
      surfaceContainer: Color(0xFFF1F4F9),
      surfaceContainerHigh: Color(0xFFE9EEF6),
      surfaceContainerHighest: Color(0xFFE1E8F2),

      textPrimary: Color(0xFF191C20),
      textSecondary: Color(0xFF44474E),

      border: Color(0xFFE1E8F2),
      outline: Color(0xFFD0D7E2),
      outlineVariant: Color(0xFFE1E8F2),

      shadow: Colors.black,
      scrim: Colors.black54,

      inverseSurface: Color(0xFF2B2F36),
      onInverseSurface: Colors.white,
      inversePrimary: Color(0xFFA9C3FF),

      divider: Color(0xFFE1E8F2),
    );

    return FaThemeTokens(
      colors: colors,

      spacing: const FaSpacingTokens(xs: 4, sm: 8, md: 12, lg: 16, xl: 24),

      elevation: const FaElevationTokens(level1: 0, level2: 2, level3: 4),

      radius: const FaRadiusTokens(sm: 6, md: 12, lg: 14, xl: 18),

      typography: const FaTypographyTokens(
        body: TextStyle(fontSize: 14, fontFamily: "Inter"),
        title: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Inter",
        ),
        caption: TextStyle(fontSize: 12, fontFamily: "Inter"),
      ),

      components: const FaComponentTokens(),

      layout: const FaLayoutTokens(sidebarWidth: 260, contentMaxWidth: 1200),

      layoutColors: const FaLayoutColorTokens(
        sidebarSurface: Color(0xFF1E293B),
        onSidebarSurface: Color(0xFFF1F3F4),
        topbarSurface: Colors.white,
        onTopbarSurface: Color(0xFF355CA8),
      ),

      motion: const FaMotionTokens(),
    );
  }
}
