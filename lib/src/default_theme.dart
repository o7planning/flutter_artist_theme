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
  Color get seedColor => const Color(0xFF6750A4);

  @override
  Brightness get brightness => Brightness.light;

  @override
  String? get fontFamily => null;

  @override
  FaThemeTokens createThemeTokens() {
    final colors = FaColorTokens(
      // ===== Base =====
      background: const Color(0xFFFFFBFE),

      surface: const Color(0xFFFFFBFE),

      // ===== Surface Layers =====
      surfaceContainerLowest: const Color(0xFFFFFFFF),

      surfaceContainerLow: const Color(0xFFF7F2FA),

      surfaceContainer: const Color(0xFFF3EDF7),

      surfaceContainerHigh: const Color(0xFFECE6F0),

      surfaceContainerHighest: const Color(0xFFE6E0E9),

      // ===== Brand =====
      primary: const Color(0xFF6750A4),
      onPrimary: Colors.white,

      secondary: const Color(0xFF625B71),
      onSecondary: Colors.white,

      tertiary: const Color(0xFF7D5260),
      onTertiary: Colors.white,

      error: const Color(0xFFB3261E),
      onError: Colors.white,

      // ===== Text =====
      onSurface: const Color(0xFF1C1B1F),

      onSurfaceVariant: const Color(0xFF49454F),

      textPrimary: const Color(0xFF1C1B1F),

      textSecondary: const Color(0xFF49454F),

      // ===== Border =====
      border: const Color(0xFFE7E0EC),

      outline: const Color(0xFF79747E),

      outlineVariant: const Color(0xFFCAC4D0),

      // ===== Misc =====
      shadow: Colors.black,

      scrim: Colors.black54,

      inverseSurface: const Color(0xFF313033),

      onInverseSurface: const Color(0xFFF4EFF4),

      inversePrimary: const Color(0xFFD0BCFF),

      divider: const Color(0xFFE7E0EC),
    );

    return FaThemeTokens(
      colors: colors,

      spacing: const FaSpacingTokens(xs: 4, sm: 8, md: 12, lg: 16, xl: 24),

      elevation: const FaElevationTokens(level1: 1, level2: 3, level3: 6),

      radius: const FaRadiusTokens(sm: 8, md: 12, lg: 16, xl: 24),

      typography: FaTypographyTokens(
        displayLarge: TextStyle(
          color: Color(0xFF1C1B1F),
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      components: const FaComponentTokens(),

      layout: const FaLayoutTokens(
        metrics: FaLayoutMetricsTokens(),

        colors: FaLayoutColorTokens(
          sidebarSurface: Color(0xFFF3EDF7),

          onSidebarSurface: Color(0xFF1C1B1F),

          topbarSurface: Colors.white,

          onTopbarSurface: Color(0xFF1C1B1F),
        ),
      ),

      motion: const FaMotionTokens(),
    );
  }
}
